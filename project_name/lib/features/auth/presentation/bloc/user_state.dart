import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final String response;

  UserSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class UserFailure extends UserState {
  final String error;

  UserFailure(this.error);

  @override
  List<Object> get props => [error];
}
