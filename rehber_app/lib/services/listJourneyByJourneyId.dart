import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ListJorneyModels.dart';

Future<Journey> fetchJourneyById(int id) async {
  final response = await http.get(Uri.parse('http://localhost:8080/api/journeys/$id'));

  if (response.statusCode == 200) {
    return Journey.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load journey');
  }
}
