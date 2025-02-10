import 'package:boom_car/pages/host/under_verification_screen.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class Step6 extends StatefulWidget {
  const Step6({super.key});

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: secondayColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: SizedBox(
          width: 180,
          child: Column(
            children: [
              Text(
                'Step 6 of 6',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Align(
                  alignment: Alignment(1, 0),
                  child: Image.asset('assets/icons/ic_car.png')),
              LinearProgressIndicator(
                value: 1,
                minHeight: 3,
                backgroundColor: bottomSheetColor,
                valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Car images',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Cover Photo',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 135,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bottomSheetColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: secondayColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Upload Media",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondayColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Exterior Images',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: 180,
                decoration: BoxDecoration(
                  color: bottomSheetColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: secondayColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Upload Media",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondayColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Interior Images',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: 180,
                decoration: BoxDecoration(
                  color: bottomSheetColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: secondayColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Upload Media",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondayColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Exterior  Images (With License plate',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: 180,
                decoration: BoxDecoration(
                  color: bottomSheetColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: secondayColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Upload Media",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondayColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.all(
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    minimumSize: WidgetStateProperty.all(
                        Size(double.infinity, 50)), // Set min size
                    maximumSize: WidgetStateProperty.all(
                        Size(double.infinity, 50)), // Set max size
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UnderVerificationScreen(),
                        ));
                  },
                  child: Text(
                    'VERIFY',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
