abstract class UserRepository {
  Future<String> login(String email, String password);
  Future<String> signup(
      String firstName, String lastName, String email, String password);
}
