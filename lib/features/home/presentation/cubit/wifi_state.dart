import 'package:flutter_module/features/ble/domain/entities/wifi_network.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_state.freezed.dart';

@freezed
class WiFiState with _$WiFiState {
  const factory WiFiState.initial() = _Initial;
  const factory WiFiState.scanning({required List<WiFiNetwork> networks}) =
      _Scanning;
  const factory WiFiState.loaded({required List<WiFiNetwork> networks}) =
      _Loaded;
  const factory WiFiState.error({required String message}) = _Error;
}
