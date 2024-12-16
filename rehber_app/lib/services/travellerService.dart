import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rehber_app/models/travellerModel.dart';

class TravellerService {
  Future<Traveller> getTravellerById(int travellerId) async {
    final response = await http.get(Uri.parse('http://localhost:8080/rest/api/traveller/getTravellerById/$travellerId'));
    if (response.statusCode == 200) {
      return Traveller.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load traveller');
    }
  }
}
