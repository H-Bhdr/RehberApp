import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rehber_app/models/applyModel.dart';

class ApplyService {
  final String apiUrl = 'http://localhost:8080/api/matches/apply';

  Future<void> apply(Apply apply) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(apply.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to apply');
    }
  }
}
