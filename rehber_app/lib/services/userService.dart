import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<List<User>> fetchUsers() async {
  final url = Uri.parse('http://127.0.0.1:8080/rest/api/user/getAllUsers'); 
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = jsonDecode(utf8.decode(response.bodyBytes));
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      print('Hata: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('İstek sırasında bir hata oluştu: $e');
    return [];
  }
}
