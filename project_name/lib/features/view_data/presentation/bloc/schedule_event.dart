import 'package:equatable/equatable.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class FetchSchedulesEvent extends ScheduleEvent {}
class FetchUserDataEvent extends ScheduleEvent {}
