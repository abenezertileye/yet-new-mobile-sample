

import 'package:project_name/features/auth/data/data_source/remote_data_source.dart';
import 'package:project_name/features/auth/domain/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<String> login(String email, String password) {
    return dataSource.login(email, password);
  }
  @override
  Future<String> signup(String firstName, String lastName, String email, String password) {
    return dataSource.signup(firstName, lastName, email, password);
  }
}