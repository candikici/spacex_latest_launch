import 'package:intl/intl.dart';
import 'package:spacex_latest_launch/models/failure.dart';
import 'package:spacex_latest_launch/models/patch.dart';

class Launch {
  String id;
  String name;
  String details;
  String date;
  Patch patch;
  String? article;
  String? wikipedia;
  String? rocket;
  String? webcast;
  List<Failure>? failures;
  Launch({
    required this.id,
    required this.name,
    required this.details,
    required this.patch,
    required this.date,
    this.webcast,
    this.article,
    this.wikipedia,
    this.rocket,
    this.failures,
  });

  factory Launch.fromMap(Map<String, dynamic> map) {
    return Launch(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      details: map['details'] ?? '',
      patch: Patch.fromMap(map['links']['patch']),
      article: map['links']['article'],
      wikipedia: map['links']['wikipedia'],
      webcast: map['links']['webcast'],
      rocket: map['rocket'],
      date: DateFormat("dd/MM/yyyy").format(DateTime.parse(map['date_utc'])),
      failures: map['failures'] != null
          ? List<Failure>.from(map['failures']?.map((x) => Failure.fromMap(x)))
          : null,
    );
  }

  @override
  String toString() {
    return 'Launch(id: $id, name: $name, details: $details, patch: $patch, article: $article, webcast: $webcast, wikipedia: $wikipedia, rocket: $rocket, failures: $failures)';
  }
}
