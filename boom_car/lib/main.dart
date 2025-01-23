import 'package:boom_car/pages/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:boom_car/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boom car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
        scaffoldBackgroundColor: Colors.black,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Colors.black,
            ),
            foregroundColor: WidgetStatePropertyAll(
              Colors.white,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            ),
            side: WidgetStatePropertyAll(BorderSide(color: secondayColor)),
            minimumSize: WidgetStateProperty.all(
              Size(235, 39),
            ),
            maximumSize: WidgetStateProperty.all(
              Size(235, 39),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              secondayColor,
            ),
            foregroundColor: WidgetStatePropertyAll(
              Colors.black,
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            minimumSize: WidgetStateProperty.all(
              Size(235, 39),
            ),
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 25),
          titleLarge: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 30),
          bodyMedium: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          displaySmall: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white38,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
        inputDecorationTheme: InputDecorationTheme(
          constraints: BoxConstraints(
            maxHeight: 42,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: secondayColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: secondayColor,
            ),
          ),
          filled: true,
          fillColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
    );
  }
}
