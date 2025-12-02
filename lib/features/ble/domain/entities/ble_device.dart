class BleDevice {
  final String address;
  final String name;
  final int rssi;
  final int lastSeen;

  BleDevice({
    required this.address,
    required this.name,
    required this.rssi,
    required this.lastSeen,
  });

  factory BleDevice.fromMap(Map<String, dynamic> map) {
    return BleDevice(
      address: map['address'] as String,
      name: map['name'] as String,
      rssi: map['rssi'] as int,
      lastSeen: map['lastSeen'] as int,
    );
  }

  String get signalStrength {
    if (rssi >= -50) return 'Excellent';
    if (rssi >= -60) return 'Good';
    if (rssi >= -70) return 'Fair';
    return 'Weak';
  }

  String get formattedLastSeen {
    final now = DateTime.now().millisecondsSinceEpoch;
    final diff = now - lastSeen;
    final seconds = diff ~/ 1000;

    if (seconds < 60) return 'Just now';
    if (seconds < 3600) return '${seconds ~/ 60}m ago';
    return '${seconds ~/ 3600}h ago';
  }
}
