import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rehber_app/models/travellerRegisterModel.dart';

class TravellerRegisterService {
  static const String _url = 'http://localhost:8080/rest/api/guide/saveGuide';

  Future<void> registerTraveller(TravellerRegisterModel traveller) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(traveller.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register traveller');
    }
  }
}
