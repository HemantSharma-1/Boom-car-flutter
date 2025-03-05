import 'package:boom_car/services/api/auth/get_user.dart';
import 'package:boom_car/services/api/auth/update_user.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:boom_car/utils/common_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:boom_car/services/models/user_model.dart';

class EditPRofile extends StatefulWidget {
  const EditPRofile({super.key});

  @override
  State<EditPRofile> createState() => _EditPRofileState();
}

class _EditPRofileState extends State<EditPRofile> {
  late User? user;
  late String? token;
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController phnoCntrl = TextEditingController();
  String? _errorMessage; // Store error messages

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    phnoCntrl.dispose();
    super.dispose();
  }

  Future<String> getUserInfo() async {
    // Create storage
    final storage = FlutterSecureStorage();
    // Read value
    token = await storage.read(key: 'authToken');
    user = await UserDetails().userDetails(token: token!);
    if (user!.success) {
      nameCtrl.text = user!.user.name;
      emailCtrl.text = user!.user.email;
      phnoCntrl.text = user!.user.phone;
    }
    return '';
  }

  Future<void> updateUser() async {
    try {
      setState(() {
        _errorMessage = null; // Reset previous errors
      });
      showLoaderDialog(context);
      final response = await UpdateUser().updateUser(
        email: emailCtrl.text,
        password: passwordCtrl.text,
        name: nameCtrl.text,
        auth: token!,
      );
      Navigator.pop(context);
      if (response['success']) {
        Navigator.pop(context);
      } else {
        setState(() {
          _errorMessage = response["message"] ?? "Login failed. Try again.";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Failed. Try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: secondayColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: secondayColor),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "User Name",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameCtrl,
                        decoration: InputDecoration(
                          hintText: "Enter New Username",
                          fillColor: bottomSheetColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Phone Number",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phnoCntrl,
                        decoration: InputDecoration(
                            hintText: "+91-12345-67890",
                            fillColor: bottomSheetColor,
                            enabled: false),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email ID",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailCtrl,
                        decoration: InputDecoration(
                          hintText: "Enter New Email-ID",
                          fillColor: bottomSheetColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Password",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordCtrl,
                        decoration: InputDecoration(
                          hintText: "Enter New Password",
                          fillColor: bottomSheetColor,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                          onPressed: updateUser,
                          child: Text('Save Changes'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong!!"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: secondayColor,
              ),
            );
          }
        },
      ),
    );
  }
}
