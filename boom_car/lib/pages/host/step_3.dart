import 'package:boom_car/pages/host/step_4.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  String selectedOption = 'Self Drive'; // Default selected option

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
                'Step 3 of 6',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Align(
                  alignment: Alignment(0.1, 0),
                  child: Image.asset('assets/icons/ic_car.png')),
              LinearProgressIndicator(
                value: 0.6,
                minHeight: 3,
                backgroundColor: bottomSheetColor,
                valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset('assets/images/img_step3.png'),
              ),
              SizedBox(
                height: 30,
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
                    prefixIcon: Image.asset('assets/icons/ic_user_host.png'),
                    hintText: "Owner Name"),
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
                    prefixIcon: Image.asset('assets/icons/ic_car_date.png'),
                    hintText: "Registration Number"),
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
                    prefixIcon: Image.asset('assets/icons/ic_car_date.png'),
                    hintText: "Chassis Number"),
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
                    prefixIcon: Image.asset('assets/icons/ic_car_date.png'),
                    hintText: "Engine Number"),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Car Listing For',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Row(
                  children: [
                    Radio<String>(
                      value: 'Self Drive',
                      groupValue: selectedOption,
                      activeColor: secondayColor,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    Text('Self Drive'),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Radio<String>(
                      value: 'With Driver',
                      groupValue: selectedOption,
                      activeColor: secondayColor,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    Text('With Driver'),
                  ],
                ),
              ]),
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
                          builder: (context) => Step4(),
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
