import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rehber_app/models/registerModel.dart';

class RegisterService {
  final String _baseUrl = 'http://127.0.0.1:8080/rest/api/traveller';

  Future<bool> registerUser(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/saveTraveller'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(registerModel.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
