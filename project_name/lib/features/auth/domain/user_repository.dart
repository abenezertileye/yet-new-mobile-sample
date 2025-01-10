
abstract class UserRepository {
  Future<String> login(String email, String password);
}