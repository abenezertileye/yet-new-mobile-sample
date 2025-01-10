class Schedule {
  final String id;
  final String scheduleName;
  final DateTime date;
  final int laps;
  final int expectedIncome;
  final Map<String, dynamic> bus;
  final Map<String, dynamic> driver;
  final Map<String, dynamic> helper;
  final Map<String, dynamic> route;
  final String createdBy;

  Schedule({
    required this.id,
    required this.scheduleName,
    required this.date,
    required this.laps,
    required this.expectedIncome,
    required this.bus,
    required this.driver,
    required this.helper,
    required this.route,
    required this.createdBy,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['_id'],
      scheduleName: json['schedule_name'],
      date: DateTime.parse(json['date']),
      laps: json['laps'],
      expectedIncome: json['expected_income'],
      bus: json['bus'],
      driver: json['driver'],
      helper: json['helper'],
      route: json['route'],
      createdBy: json['createdBy'],
    );
  }
}
