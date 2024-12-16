import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/GuideCreateJourneyService.dart';
import '../../models/guideCreateJourneyModel.dart';

class GuideHomePage extends StatefulWidget {
  const GuideHomePage({super.key});

  @override
  State<GuideHomePage> createState() => _GuideHomePageState();
}

class _GuideHomePageState extends State<GuideHomePage> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  int? _guideId;

  @override
  void initState() {
    super.initState();
    _loadGuideId();
  }

  Future<void> _loadGuideId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _guideId = prefs.getInt('guide_id');
    });
  }

  Future<void> _setGuideId(int guideId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('guide_id', guideId);
    setState(() {
      _guideId = guideId;
    });
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _createJourney() async {
    if (_guideId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Guide ID not found')),
      );
      return;
    }

    final journey = GuideCreateJourneyModel(
      guideId: _guideId!,
      destination: _destinationController.text,
      description: _descriptionController.text,
      startDate: _startDateController.text,
      endDate: _endDateController.text,
    );

    try {
      await GuideCreateJourneyService().createJourney(journey);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Journey created successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create journey')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Gezi Oluştur',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                margin: EdgeInsets.all(16.0),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _destinationController,
                        decoration: InputDecoration(
                          labelText: 'Konum',
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Açıklama',
                          prefixIcon: Icon(Icons.description),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _startDateController,
                        decoration: InputDecoration(
                          labelText: 'Başlangış Tarihi',
                          prefixIcon: Icon(Icons.calendar_today),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () => _selectDate(context, _startDateController),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _endDateController,
                        decoration: InputDecoration(
                          labelText: 'Bitiş Tarihi',
                          prefixIcon: Icon(Icons.calendar_today),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () => _selectDate(context, _endDateController),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton.icon(
                        onPressed: _createJourney,
                        icon: Icon(Icons.send),
                        label: Text('Olustur'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}