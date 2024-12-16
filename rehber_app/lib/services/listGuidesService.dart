import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/ListGuidesModel.dart';

// ...existing code...

class GuideService {
  // ...existing code...

  Future<List<Guide>> getAllGuides() async {
    final response = await http.get(Uri.parse('http://localhost:8080/rest/api/guide/getAllGuides'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((guide) => Guide.fromJson(guide)).toList();
    } else {
      throw Exception('Failed to load guides');
    }
  }

  Future<Guide> getGuideById(String id) async {
    final response = await http.get(Uri.parse('http://localhost:8080/rest/api/guide/getGuideById/$id'));

    if (response.statusCode == 200) {
      return Guide.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load guide');
    }
  }
 // ...existing code...
  
}
