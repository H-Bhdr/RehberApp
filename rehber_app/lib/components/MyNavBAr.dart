import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  final int currentPage;
  final ValueChanged<int> onTap;

  const MyNavBar({super.key, required this.currentPage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Icon(Icons.home),
            ), label: ""),
            BottomNavigationBarItem(icon: Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Icon(Icons.assignment),
            ), label: ""),
            BottomNavigationBarItem(icon: Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Icon(Icons.notifications),
            ), label: ""),
            BottomNavigationBarItem(icon: Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Icon(Icons.person),
            ), label: ""),
          ],
          currentIndex: currentPage,
          onTap: onTap,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
        ),
      ),
    );
  }
}
