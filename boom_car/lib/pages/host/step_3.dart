import 'package:boom_car/pages/host/step_4.dart';
import 'package:boom_car/pages/host/step_5.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:boom_car/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Step3 extends StatefulWidget {
  const Step3(
      {super.key,
      required this.carId,
      required this.city,
      required this.endDate,
      required this.startDate});
  final String carId;
  final String city;
  final String startDate;
  final String endDate;
  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  String selectedOption = 'Self Drive';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ownerNameCntrl = TextEditingController();
  final TextEditingController registerationNumberCntrl =
      TextEditingController();
  final TextEditingController chasiNumberCntrl = TextEditingController();
  final TextEditingController engineNumberCntrl = TextEditingController();
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
          child: Form(
            key: _formKey,
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(alphaCharacters)
                  ],
                  validator: (value) => validator(value),
                  controller: ownerNameCntrl,
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
                  validator: (value) => validator(value),
                  controller: registerationNumberCntrl,
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
                  validator: (value) => validator(value),
                  controller: chasiNumberCntrl,
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
                  validator: (value) => validator(value),
                  controller: engineNumberCntrl,
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
                      if (_formKey.currentState!.validate() && mounted) {
                        selectedOption == "Self Drive"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Step5(
                                    carId: widget.carId,
                                    city: widget.city,
                                    endDate: widget.endDate,
                                    startDate: widget.startDate,
                                    chasiNumber: chasiNumberCntrl.text,
                                    engineNumber: engineNumberCntrl.text,
                                    ownerName: ownerNameCntrl.text,
                                    registrationNumber: registerationNumberCntrl.text,
                                    type: selectedOption,
                                  ),
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Step4(
                                    chasiNumber: chasiNumberCntrl.text,
                                    engineNumber: engineNumberCntrl.text,
                                    ownerName: ownerNameCntrl.text,
                                    registrationNumber: registerationNumberCntrl.text,
                                    type: selectedOption,
                                    carId: widget.carId,
                                    city: widget.city,
                                    endDate: widget.endDate,
                                    startDate: widget.startDate,
                                  ),
                                ),
                              );
                      }
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
      ),
    );
  }
}
