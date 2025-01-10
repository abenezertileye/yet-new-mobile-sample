import 'package:project_name/features/view_data/data/data_source/remote_data_source.dart';
import 'package:project_name/features/view_data/data/model/schedule.dart';
import 'package:project_name/features/view_data/domain/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleDataSource dataSource;

  ScheduleRepositoryImpl({required this.dataSource});

  @override
  Future<List<Schedule>> getSchedules() {
    return dataSource.fetchSchedules();
  }
}
