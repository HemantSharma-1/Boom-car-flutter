import 'package:boom_car/pages/host/step_5.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
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
                'Step 4 of 6',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Align(
                  alignment: Alignment(0.6, 0),
                  child: Image.asset('assets/icons/ic_car.png')),
              LinearProgressIndicator(
                value: 0.8,
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
                'Driver Details',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset('assets/images/img_step4.png'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: bottomSheetColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    prefixIcon: Image.asset('assets/icons/ic_driver.png'),
                    hintText: "Driver Name"),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: bottomSheetColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    prefixIcon: Image.asset('assets/icons/ic_adhaar.png'),
                    hintText: "Enter Adhaar card number"),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: bottomSheetColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    prefixIcon: Image.asset('assets/icons/ic_experience.png'),
                    hintText: "Enter No of Year Experience"),
              ),
              SizedBox(
                height: 15,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 1,
                dashPattern: [6],
                radius: Radius.circular(16),
                color: Colors.white,
                child: Container(
                  height: 125,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bottomSheetColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/ic_uploader.png'),
                      Text(
                        "Upload Driver's Photo",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: secondayColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                          builder: (context) => Step5(),
                        ));
                  },
                  child: Text(
                    'NEXT',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
