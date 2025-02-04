import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDataSource {
  final String baseUrl;
  final storage = FlutterSecureStorage();

  UserDataSource({required this.baseUrl});

  Future<String> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    print('responseData: ${response.body}');

    if (response.statusCode == 200) {
      // Decode the JSON response
      final responseData = jsonDecode(response.body);

      // Store the 'USER_ID' as a string
      await storage.write(
          key: 'USER_ID', value: responseData['_id'].toString());

      return response.body;
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<String> signup(
      String firstName, String lastName, String email, String password) async {
    final url = Uri.parse('$baseUrl/users/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password
      }),
    );

    print('responseData: ${response.body}');

    if (response.statusCode == 200) {
      // Decode the JSON response
      final responseData = jsonDecode(response.body);

      // Store the 'USER_ID' as a string
      await storage.write(
          key: 'USER_ID', value: responseData['_id'].toString());

      return response.body;   
    } else {
      throw Exception('Failed to log in');
    }
  }
}
