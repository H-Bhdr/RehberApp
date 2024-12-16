import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rehber_app/models/ListJorneyModels.dart';
import '../models/matchModel.dart';
import 'listJourneyByJourneyId.dart'; // Import the journey service

class MatchService {
  final String baseUrl = 'http://localhost:8080/api/matches';

  Future<List<Match>> getMatchesByTraveller(int travellerId) async {
    final response = await http.get(Uri.parse('$baseUrl/listByTraveller?travellerId=$travellerId'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Match> matches = body.map((dynamic item) => Match.fromJson(item)).toList();
      return matches;
    } else {
      throw Exception('Failed to load matches');
    }
  }

  Future<List<Journey>> getJourneysByTraveller(int travellerId) async {
    List<Match> matches = await getMatchesByTraveller(travellerId);
    List<Journey> journeys = [];

    for (Match match in matches) {
      Journey journey = await fetchJourneyById(match.journeyId);
      journeys.add(journey);
    }

    return journeys;
  }

  Future<List<Match>> getMatchesByJourneyId(int journeyId) async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/matches/list'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => Match.fromJson(json))
          .where((match) => match.journeyId == journeyId)
          .toList();
    } else {
      throw Exception('Failed to load matches');
    }
  }

  Future<List<Match>> getMatchesByGuide(int guideId) async {
    final response = await http.get(Uri.parse('$baseUrl/listByGuide?guideId=$guideId'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Match> matches = body.map((dynamic item) => Match.fromJson(item)).toList();
      return matches;
    } else {
      throw Exception('Failed to load matches');
    }
  }

  Future<List<Journey>> getJourneysByGuide(int guideId) async {
    List<Match> matches = await getMatchesByGuide(guideId);
    List<Journey> journeys = [];

    for (Match match in matches) {
      Journey journey = await fetchJourneyById(match.journeyId);
      journeys.add(journey);
    }

    return journeys;
  }
}
