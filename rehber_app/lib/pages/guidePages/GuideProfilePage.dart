import 'package:flutter/material.dart';
import 'package:rehber_app/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/listGuidesService.dart';
import '../../models/ListGuidesModel.dart';

class GuideProfilePage extends StatefulWidget {
  const GuideProfilePage({super.key});

  @override
  State<GuideProfilePage> createState() => _GuideProfilePageState();
}

class _GuideProfilePageState extends State<GuideProfilePage> {
  String? guideId;
  String? errorMessage;
  Guide? guide;

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
      _fetchGuideDetails(id.toString());
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> _fetchGuideDetails(String id) async {
    try {
      final guideService = GuideService();
      final fetchedGuide = await guideService.getGuideById(id);
      setState(() {
        guide = fetchedGuide;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Guide?>(
          future: Future.value(guide),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final guide = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin: const EdgeInsets.all(20),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: guide.profilePicture != null ? NetworkImage(guide.profilePicture!) : null,
                            backgroundColor: Colors.teal,
                            child: guide.profilePicture == null ? Icon(Icons.person, size: 50, color: Colors.white) : null,
                          ),
                          const SizedBox(height: 20),
                          _buildProfileDetail(Icons.person, 'First Name', guide.firstName),
                                                    const SizedBox(height: 7),

                          _buildProfileDetail(Icons.person_outline, 'Last Name', guide.lastName),
                                                                              const SizedBox(height: 7),

                          _buildProfileDetail(Icons.email, 'Email', guide.email),
                          const SizedBox(height: 7),
                          _buildProfileDetail(Icons.phone, 'Phone Number', guide.phoneNumber),
                          const SizedBox(height: 7),
                          _buildProfileDetail(Icons.info, 'Bio', guide.bio, isBio: true),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _logout,
                    icon: Icon(Icons.logout, color: Colors.white),
                    label: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              );
            } else {
              return const Text('No data');
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileDetail(IconData icon, String label, String value, {bool isBio = false}) {
    return Row(
      crossAxisAlignment: isBio ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label: $value',
            style: TextStyle(fontSize: 18),
            maxLines: isBio ? null : 1,
            overflow: isBio ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}