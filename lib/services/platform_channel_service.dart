import 'package:flutter/services.dart';
import 'package:flutter_module/features/ble/domain/entities/wifi_network.dart';
import '../features/ble/domain/entities/ble_device.dart';

class PlatformChannelService {
  static const _methodChannel = MethodChannel('com.eyepax.mvvm_app/user_data');
  static const _bleEventChannel = EventChannel(
    'com.eyepax.mvvm_app/ble_stream',
  );
  static const _wifiEventChannel = EventChannel(
    'com.eyepax.mvvm_app/wifi_stream',
  );

  // User Data
  Future<Map<String, dynamic>?> getUserDataFromNative() async {
    try {
      final result = await _methodChannel.invokeMethod('getUserData');
      return Map<String, dynamic>.from(result);
    } on PlatformException catch (e) {
      print("Failed to get user data: ${e.message}");
      return null;
    }
  }

  // BLE Methods
  Future<void> startBleScan() async {
    try {
      await _methodChannel.invokeMethod('startBleScan');
    } on PlatformException catch (e) {
      print("Failed to start BLE scan: ${e.message}");
      rethrow;
    }
  }

  Future<void> stopBleScan() async {
    try {
      await _methodChannel.invokeMethod('stopBleScan');
    } on PlatformException catch (e) {
      print("Failed to stop BLE scan: ${e.message}");
    }
  }

  Future<List<BleDevice>> getSavedBleDevices() async {
    try {
      final result = await _methodChannel.invokeMethod('getSavedBleDevices');
      final List<dynamic> deviceList = result as List<dynamic>;
      return deviceList
          .map((item) => BleDevice.fromMap(Map<String, dynamic>.from(item)))
          .toList();
    } on PlatformException catch (e) {
      print("Failed to get saved BLE devices: ${e.message}");
      return [];
    }
  }

  Future<bool> isBluetoothEnabled() async {
    try {
      final result = await _methodChannel.invokeMethod('isBluetoothEnabled');
      return result as bool;
    } on PlatformException catch (e) {
      print("Failed to check Bluetooth status: ${e.message}");
      return false;
    }
  }

  Stream<List<BleDevice>> get bleDeviceStream {
    return _bleEventChannel.receiveBroadcastStream().map((event) {
      final List<dynamic> deviceList = event as List<dynamic>;
      return deviceList
          .map((item) => BleDevice.fromMap(Map<String, dynamic>.from(item)))
          .toList();
    });
  }

  // Wi-Fi Methods - ADD THESE
  Future<void> startWiFiScan() async {
    try {
      await _methodChannel.invokeMethod('startWiFiScan');
    } on PlatformException catch (e) {
      print("Failed to start Wi-Fi scan: ${e.message}");
      rethrow;
    }
  }

  Future<void> stopWiFiScan() async {
    try {
      await _methodChannel.invokeMethod('stopWiFiScan');
    } on PlatformException catch (e) {
      print("Failed to stop Wi-Fi scan: ${e.message}");
    }
  }

  Future<List<WiFiNetwork>> getSavedWiFiNetworks() async {
    try {
      final result = await _methodChannel.invokeMethod('getSavedWiFiNetworks');
      final List<dynamic> networkList = result as List<dynamic>;
      return networkList
          .map((item) => WiFiNetwork.fromMap(Map<String, dynamic>.from(item)))
          .toList();
    } on PlatformException catch (e) {
      print("Failed to get saved Wi-Fi networks: ${e.message}");
      return [];
    }
  }

  Future<bool> isWiFiEnabled() async {
    try {
      final result = await _methodChannel.invokeMethod('isWiFiEnabled');
      return result as bool;
    } on PlatformException catch (e) {
      print("Failed to check Wi-Fi status: ${e.message}");
      return false;
    }
  }

  Stream<List<WiFiNetwork>> get wifiNetworkStream {
    return _wifiEventChannel.receiveBroadcastStream().map((event) {
      final List<dynamic> networkList = event as List<dynamic>;
      return networkList
          .map((item) => WiFiNetwork.fromMap(Map<String, dynamic>.from(item)))
          .toList();
    });
  }
}
