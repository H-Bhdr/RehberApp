import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profileModel.dart';

class ProfileService {
  final String baseUrl = 'http://localhost:8080/rest/api/traveller';

  Future<ProfileModel> getProfileById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/getTravellerById/$id'));

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
