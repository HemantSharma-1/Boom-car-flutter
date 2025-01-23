import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                "Welcome Back!",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Center(
              child: Image.asset('assets/images/img_login.png'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              constraints: const BoxConstraints(maxHeight: 425),
              decoration: BoxDecoration(
                color: bottomSheetColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Log In",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Fill out your details to unlock your ride",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Log In"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    Center(child: Text("i don't have any account Sign Up"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
