import 'package:flutter/material.dart';
import 'package:rehber_app/models/ListJorneyModels.dart';
import 'package:rehber_app/services/listJourneyService.dart';
import 'package:rehber_app/services/listGuidesService.dart';
import 'package:rehber_app/models/ListGuidesModel.dart';
import 'package:rehber_app/pages/JourneyDetail.dart';
import 'package:rehber_app/components/images.dart'; // Import the images file
import 'package:intl/intl.dart'; // Import the intl package
import 'package:intl/date_symbol_data_local.dart';
import 'package:rehber_app/utils/formatDatee.dart'; // Import date symbol data for localization

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
    initializeDateFormatting('tr', null); // Initialize date formatting for Turkish
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
    return FutureBuilder<List<Journey>>(
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
            padding: EdgeInsets.only(bottom: 50), // Adjusted padding to the bottom
            shrinkWrap: true, // Added to prevent infinite size error
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final journey = snapshot.data![index];
              final imageUrl = imageUrls[index % imageUrls.length]; // Get image URL from the list
              return Card(
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JourneyDetail(journey: journey, imageUrl: imageUrl),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(imageUrl), // Display image from the list
                        SizedBox(height: 10), // Added spacing after the image
                        Row(
                          children: [
                            Text(
                              journey.destination ?? 'Unknown Destination',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.date_range, size: 18),
                            SizedBox(width: 5),
                            Text(
                              '${formatDate(journey.startDate)} - ${formatDate(journey.endDate)}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.description, size: 18),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                journey.description ?? 'No description available',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        FutureBuilder<String>(
                          future: fetchGuideName(journey.guideId.toString()),
                          builder: (context, guideSnapshot) {
                            if (guideSnapshot.connectionState == ConnectionState.waiting) {
                              return Row(
                                children: [
                                  Icon(Icons.person, size: 18),
                                  SizedBox(width: 5),
                                  Text('Loading guide name...'),
                                ],
                              );
                            } else if (guideSnapshot.hasError) {
                              return Row(
                                children: [
                                  Icon(Icons.person, size: 18),
                                  SizedBox(width: 5),
                                  Text('Error loading guide name'),
                                ],
                              );
                            } else {
                              return Row(
                                children: [
                                  Icon(Icons.person, size: 18),
                                  SizedBox(width: 5),
                                  Text(
                                    'Rehber: ${guideSnapshot.data}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                        SizedBox(height: 5),
                    
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
