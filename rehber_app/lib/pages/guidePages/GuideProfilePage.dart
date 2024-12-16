import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuideProfilePage extends StatefulWidget {
  const GuideProfilePage({super.key});

  @override
  State<GuideProfilePage> createState() => _GuideProfilePageState();
}

class _GuideProfilePageState extends State<GuideProfilePage> {
  String? guideId;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadGuideId();
  }

  Future<void> _loadGuideId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.get('guide_id');
      if (id == null || (id is String && id.isEmpty)) {
        throw Exception('Invalid guide ID');
      }
      setState(() {
        guideId = id.toString();
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Removed individual color setting

      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Guide Profile Page"),
            if (guideId != null) Text("Guide ID: $guideId"),
            if (errorMessage != null) Text("Error: $errorMessage", style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}