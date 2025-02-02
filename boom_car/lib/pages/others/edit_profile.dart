import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class EditPRofile extends StatefulWidget {
  const EditPRofile({super.key});

  @override
  State<EditPRofile> createState() => _EditPRofileState();
}

class _EditPRofileState extends State<EditPRofile> {
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
      body: SingleChildScrollView(
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
                  decoration: InputDecoration(
                    hintText: "+91-12345-67890",
                    fillColor: bottomSheetColor,
                  ),
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
                  decoration: InputDecoration(
                    hintText: "Enter New Password",
                    fillColor: bottomSheetColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Save Changes')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
