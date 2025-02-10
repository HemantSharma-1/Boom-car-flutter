import 'package:boom_car/pages/home_page.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class UnderVerificationScreen extends StatefulWidget {
  const UnderVerificationScreen({super.key});

  @override
  State<UnderVerificationScreen> createState() =>
      _UnderVerificationScreenState();
}

class _UnderVerificationScreenState extends State<UnderVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: secondayColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Your Car details are under verification',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20,
              overflow: TextOverflow.visible,
              color: secondayColor),
          softWrap: true,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset('assets/images/img_under_verification.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.all(
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    minimumSize: WidgetStateProperty.all(
                        Size(double.infinity, 50)), // Set min size
                    maximumSize: WidgetStateProperty.all(
                        Size(double.infinity, 50)), // Set max size
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(
                    'GO TO HOMEPAGE',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
