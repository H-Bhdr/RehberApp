import 'package:flutter/material.dart';
import 'package:rehber_app/models/ListJorneyModels.dart';
import 'package:rehber_app/services/listGuidesService.dart';
import 'package:rehber_app/models/ListGuidesModel.dart';
import 'package:rehber_app/models/applyModel.dart';
import 'package:rehber_app/services/applyService.dart';
import 'package:rehber_app/services/matchService.dart'; // Add this import
import 'package:rehber_app/models/matchModel.dart'; // Add this import
import 'package:rehber_app/models/travellerModel.dart'; // Add this import
import 'package:rehber_app/services/travellerService.dart'; // Add this import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rehber_app/components/images.dart'; // Import the images file
import 'package:rehber_app/utils/formatDatee.dart'; // Add this import

class JourneyDetail extends StatefulWidget { // Change to StatefulWidget
  final Journey journey;
  final String imageUrl;

  JourneyDetail({required this.journey, required this.imageUrl});

  @override
  _JourneyDetailState createState() => _JourneyDetailState();
}

class _JourneyDetailState extends State<JourneyDetail> {
  bool _isButtonDisabled = false; // Add a state variable to track button state

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

  Future<List<String>> fetchParticipantNames(int journeyId) async {
    List<String> participantNames = [];
    try {
      List<Match> matches = await MatchService().getMatchesByJourneyId(journeyId);
      for (Match match in matches) {
        Traveller traveller = await TravellerService().getTravellerById(match.travellerId);
        participantNames.add('${traveller.firstName} ${traveller.lastName}');
      }
    } catch (e) {
      participantNames.add('Unknown Participant');
    }
    return participantNames;
  }

  void _apply(BuildContext context) async {
    setState(() {
      _isButtonDisabled = true; // Disable the button
    });

    final travellerId = await getTravellerIdFromMemory();
    final apply = Apply(
      travellerId: travellerId,
      journeyId: widget.journey.id,
      guideId: int.parse(widget.journey.guideId),
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
      setState(() {
        _isButtonDisabled = false; // Re-enable the button if application fails
      });
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
        title: Text('Gezi Detayı'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16), // Increased padding
        child: Card(
          elevation: 4, // Add elevation for shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: Padding(
            padding: EdgeInsets.all(16), // Padding inside the card
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(widget.imageUrl), // Display image from the list
                  SizedBox(height: 16), // Increased spacing after the image
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 18),
                      SizedBox(width: 8), // Increased spacing
                      Text(
                        widget.journey.destination ?? 'Unknown Destination',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Increased spacing
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 18),
                      SizedBox(width: 8), // Increased spacing
                      Text(
                        '${formatDate(widget.journey.startDate)} - ${formatDate(widget.journey.endDate)}', // Use formatDate function
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Increased spacing
                  Row(
                    children: [
                      Icon(Icons.description, size: 18),
                      SizedBox(width: 8), // Increased spacing
                      Expanded(
                        child: Text(
                          widget.journey.description ?? 'No description available',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Increased spacing
                  FutureBuilder<Guide>(
                    future: fetchGuide(widget.journey.guideId.toString()),
                    builder: (context, guideSnapshot) {
                      if (guideSnapshot.connectionState == ConnectionState.waiting) {
                        return Row(
                          children: [
                            Icon(Icons.person, size: 18),
                            SizedBox(width: 8), // Increased spacing
                            Text('Loading guide name...'),
                          ],
                        );
                      } else if (guideSnapshot.hasError) {
                        return Row(
                          children: [
                            Icon(Icons.person, size: 18),
                            SizedBox(width: 8), // Increased spacing
                            Text('Error loading guide name'),
                          ],
                        );
                      } else {
                        final guide = guideSnapshot.data!;
                        return Row(
                          children: [
                            Icon(Icons.person, size: 18),
                            SizedBox(width: 8), // Increased spacing
                            Text(
                              'Rehber: ${guide.firstName} ${guide.lastName}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 8), // Increased spacing
              
                  SizedBox(height: 16), // Increased spacing
                  Text(
                    'Katılımcılar:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8), // Increased spacing
                  FutureBuilder<List<String>>(
                    future: fetchParticipantNames(widget.journey.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error loading participant names');
                      } else {
                        final participantNames = snapshot.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: participantNames.length,
                          itemBuilder: (context, index) {
                            return Text(
                              participantNames[index],
                              style: TextStyle(fontSize: 14),
                            );
                          },
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20), // Increased spacing
                  Center(
                    child: ElevatedButton(
                      onPressed: _isButtonDisabled ? null : () => _apply(context), // Disable button if _isButtonDisabled is true
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.orange, // Set text color to white
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Added padding
                        textStyle: TextStyle(fontSize: 16), // Increased font size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                      ),
                      child: Text('Katıl'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
