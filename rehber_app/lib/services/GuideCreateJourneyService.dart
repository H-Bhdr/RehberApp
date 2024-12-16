import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/guideCreateJourneyModel.dart';

class GuideCreateJourneyService {
  static const String apiUrl = 'http://localhost:8080/api/journeys/create';

  Future<void> createJourney(GuideCreateJourneyModel journey) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(journey.toJson()),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Failed to create journey');
    }
  }
}
