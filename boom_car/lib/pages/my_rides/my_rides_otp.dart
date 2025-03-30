import 'dart:io';
import 'package:boom_car/pages/home_page.dart';
import 'package:boom_car/services/api/guest/guest_start_booking.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pinput/pinput.dart';

class MyRidesVerifyOtp extends StatefulWidget {
  const MyRidesVerifyOtp({
    super.key,
    required this.bookingId,
    required this.carImages,
  });
  final String bookingId;
  final List<File> carImages;
  @override
  State<MyRidesVerifyOtp> createState() => _MyRidesVerifyOtpState();
}

class _MyRidesVerifyOtpState extends State<MyRidesVerifyOtp> {
  Future rentCar() async {
    final storage = FlutterSecureStorage();
    // Check if token exists
    final token = await storage.read(key: 'authToken');
    final data = await StartBooking().startBooking(
        bookingId: widget.bookingId,
        otp: otpCtrl.text,
        carImages: widget.carImages,
        authToken: token!);

    print(data);
  }

  final TextEditingController otpCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fill up OTP",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: secondayColor,
                fontSize: 17,
              ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: secondayColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(
                'assets/images/img_my_ride_otp.png',
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter OTP",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: secondayColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter the OTP provided by the host to rent a car.",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Pinput(
                      controller: otpCtrl,
                      length: 5,
                      defaultPinTheme: PinTheme(
                        height: 70,
                        width: 50,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        minimumSize: WidgetStateProperty.all(
                          Size(double.infinity, 50),
                        ),
                        maximumSize: WidgetStateProperty.all(
                          Size(double.infinity, 50),
                        ),
                        textStyle: WidgetStateProperty.all(
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onPressed: () {
                        rentCar();
                      },
                      child: Text("RENT A CAR"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
