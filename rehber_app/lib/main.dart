import 'package:flutter/material.dart';
import 'package:rehber_app/components/MyNavBAr.dart';
import 'package:rehber_app/pages/guidePages/GuideProfilePage.dart';
import 'package:rehber_app/pages/guidePages/guideHomePage.dart';
import 'package:rehber_app/pages/guidePages/guideJourneyPage.dart';
import 'package:rehber_app/pages/homePage.dart';
import 'package:rehber_app/pages/MyjourneysPage.dart';
import 'package:rehber_app/pages/loginPage.dart';
import 'package:rehber_app/pages/profilePage.dart';
import 'package:rehber_app/utils/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package

void main() async {
 
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
 
 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         iconTheme: IconThemeData(color: Colors.blue),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Roboto', // Ensure font supports Turkish characters globally
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Add this key

  var pageList1 = [
    const HomePage(),
    const JourneyPage(),
    const ProfilePage(),
    const ProfilePage()
  ];
  
  var pageList2 = [
    const GuideHomePage(),
    const GuideJourneyPage(),
    const GuideProfilePage(),
    const GuideProfilePage()
  ];

  int currentPage = 0;
  List<Widget> currentPageList = [const CircularProgressIndicator()]; // Default value

  @override
  void initState() {
    super.initState();
    _setPageList();
  }

  void _setPageList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? travellerId = prefs.getInt('traveller_id');
    setState(() {
      currentPageList = (travellerId != null) ? pageList1 : pageList2;
    });
  }

  void setPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsiveHelper = ResponsiveHelper(context);

    return Scaffold(
      key: _scaffoldKey, // Assign the key to Scaffold
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(responsiveHelper.responsiveAppBarHeight),
        child: AppBar(
          scrolledUnderElevation: 0,
             backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                style: ButtonStyle(),
                color: Colors.blue,
                iconSize: 28,
                onPressed: () {
                  _scaffoldKey.currentState
                      ?.openEndDrawer(); // Open the end drawer
                },
                icon: const Icon(Icons.menu),
              ),
            ),
          ],
          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left: 10,top: 10),
                child: Text(
                  'Rehber',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
       
        ),
      ),
      body: currentPageList.isNotEmpty ? currentPageList[currentPage] : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: MyNavBar(
        currentPage: currentPage,
        onTap: (index) {
          setPage(index);
        },
      ),
    );
  }
}
