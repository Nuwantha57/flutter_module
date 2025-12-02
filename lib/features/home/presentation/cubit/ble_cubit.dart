import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module/features/ble/domain/entities/ble_device.dart';
import 'package:flutter_module/services/platform_channel_service.dart';
import 'ble_state.dart';

class BleCubit extends Cubit<BleState> {
  final PlatformChannelService _platformService;
  StreamSubscription<List<BleDevice>>? _deviceStreamSubscription;

  BleCubit(this._platformService) : super(const BleState.initial());

  Future<void> loadSavedDevices() async {
    try {
      final devices = await _platformService.getSavedBleDevices();
      if (devices.isEmpty) {
        emit(const BleState.initial());
      } else {
        emit(BleState.loaded(devices: devices));
      }
    } catch (e) {
      emit(BleState.error(message: e.toString()));
    }
  }

  Future<void> startScan() async {
    try {
      // Check if Bluetooth is enabled
      final isEnabled = await _platformService.isBluetoothEnabled();
      if (!isEnabled) {
        emit(
          const BleState.error(
            message: 'Bluetooth is disabled. Please enable Bluetooth.',
          ),
        );
        return;
      }

      emit(const BleState.scanning(devices: []));

      // Listen to device stream
      _deviceStreamSubscription = _platformService.bleDeviceStream.listen(
        (devices) {
          emit(BleState.scanning(devices: devices));
        },
        onError: (error) {
          emit(BleState.error(message: error.toString()));
        },
      );

      // Start the scan
      await _platformService.startBleScan();
    } catch (e) {
      emit(BleState.error(message: e.toString()));
    }
  }

  Future<void> stopScan() async {
    try {
      await _platformService.stopBleScan();
      await _deviceStreamSubscription?.cancel();
      _deviceStreamSubscription = null;

      // Load saved devices
      final devices = await _platformService.getSavedBleDevices();
      emit(BleState.loaded(devices: devices));
    } catch (e) {
      emit(BleState.error(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _deviceStreamSubscription?.cancel();
    return super.close();
  }
}
