import 'package:flutter/material.dart';
import 'package:rehber_app/models/ListJorneyModels.dart';
import 'package:rehber_app/services/listGuidesService.dart';
import 'package:rehber_app/models/ListGuidesModel.dart';
import 'package:rehber_app/models/applyModel.dart';
import 'package:rehber_app/services/applyService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JourneyDetail extends StatelessWidget {
  final Journey journey;

  JourneyDetail({required this.journey});

  Future<Guide> fetchGuide(String guideId) async {
    try {
      return await GuideService().getGuideById(guideId);
    } catch (e) {
      return Guide(
        id: 0,
        firstName: 'Unknown',
        lastName: 'Guide',
        email: '',
        phoneNumber: '',
        profilePicture: null,
        bio: '',
      );
    }
  }

  void _apply(BuildContext context) async {
    final travellerId = await getTravellerIdFromMemory(); // Fetch traveller_id from memory
    final apply = Apply(
      travellerId: travellerId,
      journeyId: journey.id,
      guideId: int.parse(journey.guideId),
      status: 'ACTIVE',
    );

    try {
      await ApplyService().apply(apply);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Application successful')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to apply')),
      );
    }
  }

  Future<int> getTravellerIdFromMemory() async {
    // Implement the logic to fetch traveller_id from memory
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('traveller_id') ?? 0; // Replace 'traveller_id' with the actual key
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                journey.destination ?? 'Unknown Destination',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '${journey.startDate ?? 'Unknown Start Date'} - ${journey.endDate ?? 'Unknown End Date'}',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(
                journey.description ?? 'No description available',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(
                'Match IDs: ${journey.matchIds?.join(', ') ?? 'None'}',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              FutureBuilder<Guide>(
                future: fetchGuide(journey.guideId.toString()),
                builder: (context, guideSnapshot) {
                  if (guideSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (guideSnapshot.hasError) {
                    return Text('Error loading guide information');
                  } else {
                    final guide = guideSnapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guide: ${guide.firstName} ${guide.lastName}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Email: ${guide.email}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Phone: ${guide.phoneNumber}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Bio: ${guide.bio}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 10),
              Text(
                'Hatches:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: journey.matchIds?.length ?? 0,
                itemBuilder: (context, index) {
                  final hatch = journey.matchIds![index];
                  return Text(
                    hatch,
                    style: TextStyle(fontSize: 14),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => _apply(context),
                  child: Text('Apply'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
