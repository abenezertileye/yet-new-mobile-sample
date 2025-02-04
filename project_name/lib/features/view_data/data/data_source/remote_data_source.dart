import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_name/features/view_data/data/model/schedule.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ScheduleDataSource {
  final String baseUrl;
  final storage = FlutterSecureStorage();

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

  Future<Map<String, dynamic>> fetchUserData() async {
    final userId = await storage.read(key: 'USER_ID');

    final response =
        await http.get(Uri.parse('$baseUrl/users/get-user-info/${userId}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final Map<String, dynamic> userData = data['data'];
      return userData;
    } else {
      throw Exception('Failed to load schedules');
    }
  }
}
