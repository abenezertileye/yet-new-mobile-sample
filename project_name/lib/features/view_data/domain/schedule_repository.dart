import 'package:project_name/features/view_data/data/model/schedule.dart';

abstract class ScheduleRepository {
  Future<List<Schedule>> getSchedules();
}
