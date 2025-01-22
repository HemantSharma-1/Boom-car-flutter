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
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25),
              ),
            ),
            Center(
              child: Image.asset('assets/images/img_login.png'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              constraints: const BoxConstraints(maxHeight: 400),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 28, 28, 28),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(78, 249, 217, 120), // Shadow color
                    blurRadius: 50, // How soft the shadow should be
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 10,
                    offset: const Offset(
                        0, -10), // Negative offset moves shadow upwards
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 35),
                    ),
                    Text(
                      "Fill out your details to unlock your ride",
                      style: TextStyle(color: Colors.white38),
                    ),
                    TextField(),
                    TextField(),
                    TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?'),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Log in")),
                    Row(
                      children: [
                        Divider(
                          color: Colors.white,
                          thickness: 2,
                          height: 10,
                        ),
                        Text(
                          'Or',
                          style: TextStyle(color: Colors.white),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 2,
                          height: 10,
                        )
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Log in with Google"),
                    ),
                    Text("i don't have any account Sign Up")
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
