import 'package:bloc/bloc.dart';
import 'package:project_name/features/view_data/domain/schedule_repository.dart';
import 'schedule_event.dart';
import 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final ScheduleRepository repository;

  ScheduleBloc(this.repository) : super(ScheduleInitial()) {
    on<FetchSchedulesEvent>((event, emit) async {
      emit(ScheduleLoading());
      try {
        final schedules = await repository.getSchedules();
        emit(ScheduleLoaded(schedules: schedules));
      } catch (e) {
        emit(ScheduleError(message: e.toString()));
      }
    });
  }
}




