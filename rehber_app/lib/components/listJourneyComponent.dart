import 'package:flutter/material.dart';
import 'package:rehber_app/models/ListJorneyModels.dart';
import 'package:rehber_app/services/listJourneyService.dart';
import 'package:rehber_app/services/listGuidesService.dart';
import 'package:rehber_app/models/ListGuidesModel.dart';
import 'package:rehber_app/pages/JourneyDetail.dart';

class ListJourneyComponent extends StatefulWidget {
  @override
  _ListJourneyComponentState createState() => _ListJourneyComponentState();
}

class _ListJourneyComponentState extends State<ListJourneyComponent> {
  late Future<List<Journey>> futureJourneys;

  @override
  void initState() {
    super.initState();
    futureJourneys = JourneyService().fetchJourneys();
  }

  Future<String> fetchGuideName(String guideId) async {
    try {
      Guide guide = await GuideService().getGuideById(guideId);
      return '${guide.firstName} ${guide.lastName}';
    } catch (e) {
      return 'Unknown Guide';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container( // Changed from Scaffold to Container
      child: FutureBuilder<List<Journey>>(
        future: futureJourneys,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Removed individual font setting
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No journeys found')); // Removed individual font setting
          } else {
            return ListView.builder(
              shrinkWrap: true, // Added to prevent infinite size error
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final journey = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JourneyDetail(journey: journey),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
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
                          FutureBuilder<String>(
                            future: fetchGuideName(journey.guideId.toString()),
                            builder: (context, guideSnapshot) {
                              if (guideSnapshot.connectionState == ConnectionState.waiting) {
                                return Text('Loading guide name...');
                              } else if (guideSnapshot.hasError) {
                                return Text('Error loading guide name');
                              } else {
                                return Text(
                                  'Guide: ${guideSnapshot.data}',
                                  style: TextStyle(fontSize: 14),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Match IDs: ${journey.matchIds?.join(', ') ?? 'None'}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
