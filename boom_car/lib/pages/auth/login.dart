import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final isLargeScreen = screenHeight > 900;
        final isMediumScreen = screenHeight > 600 && screenHeight <= 900;
        final isSmallScreen = screenHeight < 600;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                "Welcome Back!",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: isSmallScreen ? 4 : 3,
              child: Center(
                child: Image.asset('assets/images/img_login.png'),
              ),
            ),
            Expanded(
              flex: isSmallScreen ? 6 : 4,
              child: Container(),
            ),
          ],
        );
      }),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        constraints: const BoxConstraints(maxHeight: 425),
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
              offset:
                  const Offset(0, -8), // Negative offset moves shadow upwards
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                "Log In",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Fill out your details to unlock your ride",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Spacer(),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  prefixIcon: Image.asset('assets/icons/ic_email.png'),
                  hintText: "Email",
                ),
              ),
              Spacer(),
              TextFormField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: secondayColor,
                  ),
                  prefixIcon: Image.asset('assets/icons/ic_password.png'),
                  hintText: "Password",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Log In"),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/ic_google.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Log in with Google"),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Text("i don't have any account Sign Up"),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
