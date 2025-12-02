import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module/features/ble/domain/entities/wifi_network.dart';
import '../../../../services/platform_channel_service.dart';
import 'wifi_state.dart';

class WiFiCubit extends Cubit<WiFiState> {
  final PlatformChannelService _platformService;
  StreamSubscription<List<WiFiNetwork>>? _networkStreamSubscription;

  WiFiCubit(this._platformService) : super(const WiFiState.initial());

  Future<void> loadSavedNetworks() async {
    try {
      final networks = await _platformService.getSavedWiFiNetworks();
      if (networks.isEmpty) {
        emit(const WiFiState.initial());
      } else {
        emit(WiFiState.loaded(networks: networks));
      }
    } catch (e) {
      emit(WiFiState.error(message: e.toString()));
    }
  }

  Future<void> startScan() async {
    try {
      final isEnabled = await _platformService.isWiFiEnabled();
      if (!isEnabled) {
        emit(
          const WiFiState.error(
            message: 'Wi-Fi is disabled. Please enable Wi-Fi.',
          ),
        );
        return;
      }

      emit(const WiFiState.scanning(networks: []));

      _networkStreamSubscription = _platformService.wifiNetworkStream.listen(
        (networks) {
          emit(WiFiState.scanning(networks: networks));
        },
        onError: (error) {
          emit(WiFiState.error(message: error.toString()));
        },
      );

      await _platformService.startWiFiScan();
    } catch (e) {
      emit(WiFiState.error(message: e.toString()));
    }
  }

  Future<void> stopScan() async {
    try {
      await _platformService.stopWiFiScan();
      await _networkStreamSubscription?.cancel();
      _networkStreamSubscription = null;

      final networks = await _platformService.getSavedWiFiNetworks();
      emit(WiFiState.loaded(networks: networks));
    } catch (e) {
      emit(WiFiState.error(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _networkStreamSubscription?.cancel();
    return super.close();
  }
}
