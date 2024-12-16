import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ListJorneyModels.dart';

Future<Journey> fetchJourneyById(int id) async {
  final response = await http.get(Uri.parse('http://localhost:8080/api/journeys/$id'));

  if (response.statusCode == 200) {
    return Journey.fromJson(jsonDecode(utf8.decode(response.bodyBytes))); // Ensure UTF-8 decoding
  } else {
    throw Exception('Failed to load journey');
  }
}
