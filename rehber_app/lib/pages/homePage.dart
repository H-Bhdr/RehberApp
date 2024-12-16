import 'package:flutter/material.dart';
import 'package:rehber_app/components/listJourneyComponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'), // Removed individual font setting
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text('Welcome to Home Page'), // Removed individual font setting
            ),
            ListJourneyComponent(), // Added ListJourneyComponent
          ],
        ),
      ),
    );
  }
}