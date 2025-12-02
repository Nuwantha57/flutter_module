class WiFiNetwork {
  final String bssid;
  final String ssid;
  final int signalLevel;
  final String capabilities;
  final int frequency;
  final int lastSeen;
  final bool isSaved;

  WiFiNetwork({
    required this.bssid,
    required this.ssid,
    required this.signalLevel,
    required this.capabilities,
    required this.frequency,
    required this.lastSeen,
    required this.isSaved,
  });

  factory WiFiNetwork.fromMap(Map<String, dynamic> map) {
    return WiFiNetwork(
      bssid: map['bssid'] as String,
      ssid: map['ssid'] as String,
      signalLevel: map['signalLevel'] as int,
      capabilities: map['capabilities'] as String,
      frequency: map['frequency'] as int,
      lastSeen: map['lastSeen'] as int,
      isSaved: map['isSaved'] as bool,
    );
  }

  String get securityType {
    if (capabilities.contains('WPA3')) return 'WPA3';
    if (capabilities.contains('WPA2')) return 'WPA2';
    if (capabilities.contains('WPA')) return 'WPA';
    if (capabilities.contains('WEP')) return 'WEP';
    return 'Open';
  }

  String get frequencyBand {
    return frequency >= 5000 ? '5 GHz' : '2.4 GHz';
  }

  String get signalStrength {
    switch (signalLevel) {
      case 5:
        return 'Excellent';
      case 4:
        return 'Good';
      case 3:
        return 'Fair';
      case 2:
        return 'Weak';
      default:
        return 'Very Weak';
    }
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
