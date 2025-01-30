import 'package:boom_car/pages/home_page.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final isSmallScreen = screenHeight < 600;
          print(screenHeight);
          return SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 8,
                ),
                isSmallScreen
                    ? Center(
                        child: Image.asset(
                          'assets/images/img_otp.png',
                          height: 230,
                        ),
                      )
                    : Center(
                        child: Image.asset(
                          'assets/images/img_otp.png',
                        ),
                      ),
              ],
            ),
          );
        },
      ),
      bottomSheet: Builder(
        builder: (context) {
          final screenHeight = MediaQuery.of(context).size.height;
          final isSmallScreen = screenHeight < 600;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            constraints: BoxConstraints(maxHeight: isSmallScreen ? 300 : 300),
            decoration: BoxDecoration(
              color: bottomSheetColor,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50), bottom: Radius.zero),
              boxShadow: [
                BoxShadow(
                  color: shadowColor, // Shadow color
                  blurRadius: 50, // How soft the shadow should be
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 10,
                  offset: const Offset(
                      0, -8), // Negative offset moves shadow upwards
                ),
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    "Verify with OTP",
                    style: isSmallScreen
                        ? Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 20)
                        : Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Enter the code below",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Spacer(),
                  Center(
                    child: Pinput(
                      defaultPinTheme: PinTheme(
                        height: 70,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(color: secondayColor)),
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: Text("Verify"),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
