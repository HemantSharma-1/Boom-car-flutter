import 'package:boom_car/pages/auth/verify_otp.dart';
import 'package:boom_car/services/auth/sign_up.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:boom_car/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen(
      {super.key,
      required this.email,
      required this.password,
      required this.userName});
  final String userName;
  final String email;
  final String password;

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController phoneCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void signUP() async {
    if (_formKey.currentState!.validate()) {
      final response = await UserSignUp().userSignUp(
          email: widget.email,
          password: widget.password,
          name: widget.password,
          phno: phoneCtrl.text);

      if (response["success"] && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyOtp(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final isSmallScreen = screenHeight < 600;
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
                          'assets/images/img_phone.png',
                          height: 230,
                        ),
                      )
                    : Center(
                        child: Image.asset(
                          'assets/images/img_phone.png',
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      "Enter Contact No.",
                      style: isSmallScreen
                          ? Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 20)
                          : Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Enter Mobile Number to Verify",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Spacer(),
                    TextFormField(
                      controller: phoneCtrl,
                      validator: (value) => validator(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(numberCharacter),
                      ],
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          constraints: isSmallScreen
                              ? BoxConstraints(maxHeight: 40)
                              : BoxConstraints(),
                          prefixIcon: Image.asset('assets/icons/ic_phone.png'),
                          hintText: "Phone No."),
                    ),
                    Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: signUP,
                        child: Text("Continue"),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
