import 'package:flutter/material.dart';
import 'package:rehber_app/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/profileService.dart';
import '../models/profileModel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<ProfileModel?> profile;

  @override
  void initState() {
    super.initState();
    profile = Future.value(null); // Initialize with a null future
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final travelId = prefs.getInt('traveller_id');
    if (travelId != null && travelId >= 0) {
      setState(() {
        profile = ProfileService().getProfileById(travelId);
      });
    } else {
      setState(() {
        profile = Future.error('Invalid traveller ID');
      });
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('traveller_id');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: FutureBuilder<ProfileModel?>(
          future: profile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final profile = snapshot.data!;
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
                            // backgroundImage: NetworkImage(profile.profilePictureUrl),
                            backgroundColor: Colors.teal,
                            child: Icon(Icons.person, size: 50, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          Text('İsim: ${profile.firstName}', style: TextStyle(fontSize: 18)),
                          Text('Soyisim: ${profile.lastName}', style: TextStyle(fontSize: 18)),
                          Text('Email: ${profile.email}', style: TextStyle(fontSize: 18)),
                          Text('Telefon Numarası: ${profile.phoneNumber}', style: TextStyle(fontSize: 18)),
                          const SizedBox(height: 20),
                          // ElevatedButton.icon(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.edit, color: Colors.white),
                          //   label: Text('Edit Profile'),
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.teal,
                          //   ),
                          // ),
                          // ElevatedButton.icon(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.settings, color: Colors.white),
                          //   label: Text('Settings'),
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.teal,
                          //   ),
                         // ),
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
}