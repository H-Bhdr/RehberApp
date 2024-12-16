import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rehber_app/models/ListJorneyModels.dart';

class JourneyService {
  final String baseUrl = 'http://localhost:8080/api/journeys/';

  // Tüm Journey'leri getir
  Future<List<Journey>> fetchJourneys() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> journeyList = json.decode(utf8.decode(response.bodyBytes));
        return journeyList.map((json) => Journey.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load journeys. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching journeys: $e');
    }
  }

//   // Belirli bir Journey ID'sini getir
//   Future<Journey> fetchJourneyById(int id) async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl$id'));

//       if (response.statusCode == 200) {
//         return Journey.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to load journey. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching journey: $e');
//     }
//   }

//   // Yeni bir Journey ekle
//   Future<Journey> createJourney(Journey journey) async {
//     try {
//       final response = await http.post(
//         Uri.parse(baseUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'id': journey.id,
//           'destination': journey.destination,
//           'startDate': journey.startDate,
//           'endDate': journey.endDate,
//           'description': journey.description,
//           'guideId': journey.guideId,
//           'matchIds': journey.matchIds,
//         }),
//       );

//       if (response.statusCode == 201) {
//         return Journey.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to create journey. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error creating journey: $e');
//     }
//   }

//   // Journey güncelle
//   Future<Journey> updateJourney(int id, Journey journey) async {
//     try {
//       final response = await http.put(
//         Uri.parse('$baseUrl$id'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'id': journey.id,
//           'destination': journey.destination,
//           'startDate': journey.startDate,
//           'endDate': journey.endDate,
//           'description': journey.description,
//           'guideId': journey.guideId,
//           'matchIds': journey.matchIds,
//         }),
//       );

//       if (response.statusCode == 200) {
//         return Journey.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to update journey. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error updating journey: $e');
//     }
//   }

//   // Journey sil
//   Future<void> deleteJourney(int id) async {
//     try {
//       final response = await http.delete(Uri.parse('$baseUrl$id'));

//       if (response.statusCode != 204) {
//         throw Exception('Failed to delete journey. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error deleting journey: $e');
//     }
//   }
}
