import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/features/auth/domain/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final response = await repository.login(event.email, event.password);
        emit(UserSuccess(response));
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });
    on<UserSignupEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final response = await repository.signup(
            event.firstName, event.lastName, event.email, event.password);
        emit(UserSuccess(response));
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });
  }
}
