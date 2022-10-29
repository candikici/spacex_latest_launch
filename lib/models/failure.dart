class Failure {
  int time;
  int altitude;
  String reason;
  Failure({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory Failure.fromMap(Map<String, dynamic> map) {
    return Failure(
      time: map['time']?.toInt() ?? 0,
      altitude: map['altitude']?.toInt() ?? 0,
      reason: map['reason'] ?? '',
    );
  }

  @override
  String toString() =>
      'Failure(time: $time, altitude: $altitude, reason: $reason)';
}
