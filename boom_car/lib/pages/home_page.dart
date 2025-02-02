import 'package:boom_car/pages/tabs/home.dart';
import 'package:boom_car/pages/tabs/host.dart';
import 'package:boom_car/pages/tabs/my_rides.dart';
import 'package:boom_car/pages/tabs/profile.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Home(),
        MyRide(),
        Profile(),
        Host(),
      ][_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), // Rounded top left
          topRight: Radius.circular(30), // Rounded top right
        ),
        child: BottomNavigationBar(
          backgroundColor: bottomSheetColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: secondayColor, // Active icon color
          unselectedItemColor: Colors.grey, // Inactive icon color
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_repair), label: "My Rides"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: "Host")
          ],
        ),
      ),
    );
  }
}
