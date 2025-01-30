import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home page')),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomSheetColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_repair), label: "My Rides"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "person"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.car_crash_sharp), label: "Host")
        ],
      ),
    );
  }
}
