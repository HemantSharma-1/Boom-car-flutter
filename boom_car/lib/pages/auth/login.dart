import 'package:boom_car/pages/auth/sign_up.dart';
import 'package:boom_car/pages/home_page.dart';
import 'package:boom_car/services/api/auth/login.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:boom_car/utils/common_loader.dart';
import 'package:boom_car/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage; // Store error messages

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  void loginUser() async {
    // Validate returns true if the form is valid, or false otherwise.
    try {
      if (_formKey.currentState!.validate() && mounted) {
        setState(() {
          _errorMessage = null; // Reset previous errors
        });
        showLoaderDialog(context);
        final response = await UserLogin()
            .userLogin(email: emailCtrl.text, password: passwordCtrl.text);
        Navigator.pop(context);
        if (response["success"] && mounted) {
          // Create storage
          final storage = FlutterSecureStorage();
          // Write value
          await storage.write(key: 'authToken', value: response["accessToken"]);
          await storage.write(key: 'name', value: response["user"]["name"]);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          setState(() {
            _errorMessage = response["message"] ?? "Login failed. Try again.";
          });
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = "User Not Found";
      });
      print(e);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35, top: 20),
                  child: Text(
                    "Welcome Back!",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                isSmallScreen
                    ? Center(
                        child: Image.asset(
                          'assets/images/img_login.png',
                          height: 230,
                        ),
                      )
                    : Center(
                        child: Image.asset(
                          'assets/images/img_login.png',
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
            constraints: BoxConstraints(maxHeight: isSmallScreen ? 300 : 425),
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
                      "Log In",
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
                      validator: (value) => validator(value),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Spacer(),
                    // Show error message if any
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Center(
                          child: Text(
                            _errorMessage!,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          loginUser();
                        },
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("i don't have any account"),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
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
