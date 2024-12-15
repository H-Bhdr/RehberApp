import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<int> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8080/rest/api/login/authenticate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return int.tryParse(response.body) ?? 0;
  }
}
