import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoginEvent extends UserEvent {
  final String email;
  final String password;

  UserLoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class UserSignupEvent extends UserEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  UserSignupEvent(this.firstName, this.lastName, this.email, this.password);

  @override
  List<Object> get props => [firstName, lastName, email, password];
}
