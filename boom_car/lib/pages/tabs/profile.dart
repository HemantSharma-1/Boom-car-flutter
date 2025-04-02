import 'package:boom_car/pages/auth_wrapper.dart';
import 'package:boom_car/pages/others/edit_profile.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  @override
  void initState() {
    super.initState();
    getName();
  }

  getName() async {
    final storage = FlutterSecureStorage();
    // Check if token exists
    name = (await storage.read(key: 'name'))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: secondayColor),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi, $name",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Change Avatar"),
              SizedBox(
                height: 40,
              ),
              ProfileTileWidget(
                title: "Edit Profile",
                subtitle: "Change Username.Email-ID & Password",
                icon: Image.asset('assets/icons/ic_edit_profile.png'),
                ontap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPRofile(),
                  ),
                ).then((value) async {
                  await getName();
                }),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTileWidget(
                title: "Change City",
                subtitle: "Banglore",
                icon: Image.asset('assets/icons/ic_location.png'),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTileWidget(
                title: "Terms & Conditions",
                icon: Image.asset('assets/icons/ic_terms.png'),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTileWidget(
                title: "Privacy Policy",
                icon: Image.asset('assets/icons/ic_privacy.png'),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTileWidget(
                title: "Help & Support",
                icon: Image.asset('assets/icons/ic_help.png'),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTileWidget(
                title: "Rate Us",
                icon: Image.asset('assets/icons/ic_rate_us.png'),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  // Create storage
                  final storage = FlutterSecureStorage();
                  // Delete value
                  await storage.delete(key: 'authToken');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthWrapper(),
                    ),
                  );
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(color: secondayColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget(
      {super.key,
      required this.title,
      this.subtitle,
      required this.icon,
      this.ontap});
  final String title;
  final String? subtitle;
  final Widget icon;
  final GestureTapCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : null,
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: secondayColor,
      ),
      onTap: ontap,
      minTileHeight: 50,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: secondayColor),
      ),
      tileColor: bottomSheetColor,
      visualDensity: VisualDensity(vertical: -4),
    );
  }
}
