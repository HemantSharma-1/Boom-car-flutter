import 'package:boom_car/pages/auth/login.dart';
import 'package:boom_car/pages/home_page.dart';
import 'package:boom_car/pages/others/splash_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  Future<bool> isLoggedIn() async {
    await Future.delayed(Duration(
        seconds: 2)); // Add a delay to ensure the splash screen is shown
    final storage = FlutterSecureStorage();
    // Check if token exists
    final token = await storage.read(key: 'authToken');
    return token != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen(); // Show loading indicator
        } else if (snapshot.data == true) {
          return HomePage(); // Navigate to Home if authenticated
        } else {
          return LoginPage(); // Navigate to Login if not authenticated
        }
      },
    );
  }
}
