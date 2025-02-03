import 'package:boom_car/pages/auth/login.dart';
import 'package:boom_car/pages/auth/phone_number.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:boom_car/utils/validator.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameCtrl.dispose();
    passwordCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35, top: 20),
                  child: Text(
                    "Ready for New Journey?",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                isSmallScreen
                    ? Center(
                        child: Image.asset(
                          'assets/images/img_sign_up.png',
                          height: 230,
                        ),
                      )
                    : Center(
                        child: Image.asset(
                          'assets/images/img_sign_up.png',
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
            constraints: BoxConstraints(maxHeight: isSmallScreen ? 350 : 450),
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
                      "Sign up",
                      style: isSmallScreen
                          ? Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 20)
                          : Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Fill out your details to unlock your ride",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Spacer(),
                    TextFormField(
                      controller: userNameCtrl,
                      validator: (value) => validator(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          constraints: isSmallScreen
                              ? BoxConstraints(maxHeight: 40)
                              : BoxConstraints(),
                          prefixIcon: Image.asset('assets/icons/ic_user.png'),
                          hintText: "User Name"),
                    ),
                    Spacer(),
                    isSmallScreen
                        ? SizedBox(
                            height: 5,
                          )
                        : Container(),
                    TextFormField(
                      controller: emailCtrl,
                      validator: (value) =>
                          emailValidator(value: value.toString()),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          constraints: isSmallScreen
                              ? BoxConstraints(maxHeight: 40)
                              : BoxConstraints(),
                          prefixIcon: Image.asset('assets/icons/ic_email.png'),
                          hintText: "Email"),
                    ),
                    Spacer(),
                    isSmallScreen
                        ? SizedBox(
                            height: 5,
                          )
                        : Container(),
                    TextFormField(
                      controller: passwordCtrl,
                      validator: (value) => passwordValidator(value),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        constraints: isSmallScreen
                            ? BoxConstraints(maxHeight: 40)
                            : BoxConstraints(),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: secondayColor,
                        ),
                        prefixIcon: Image.asset('assets/icons/ic_password.png'),
                        hintText: "Password",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Your password must in btw 0-16 characters',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhoneNumberScreen(
                                  email: emailCtrl.text,
                                  password: passwordCtrl.text,
                                  userName: userNameCtrl.text,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text("Continue"),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("i don't have any account"),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.fontSize,
                                  color: secondayColor,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.fontFamily),
                            ),
                          )
                        ],
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
