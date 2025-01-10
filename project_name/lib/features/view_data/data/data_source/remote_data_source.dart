import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_name/features/view_data/data/model/schedule.dart';

class ScheduleDataSource {
  final String baseUrl;

  ScheduleDataSource({required this.baseUrl});

  Future<List<Schedule>> fetchSchedules() async {
    final response =
        await http.get(Uri.parse('$baseUrl/users/get-all-schedule'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> schedulesJson = data['data'];
      return schedulesJson.map((json) => Schedule.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load schedules');
    }
  }
}
