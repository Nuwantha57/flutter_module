import 'package:flutter_module/features/ble/domain/entities/ble_device.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_state.freezed.dart';

@freezed
class BleState with _$BleState {
  const factory BleState.initial() = _Initial;
  const factory BleState.scanning({required List<BleDevice> devices}) =
      _Scanning;
  const factory BleState.loaded({required List<BleDevice> devices}) = _Loaded;
  const factory BleState.error({required String message}) = _Error;
}
