import 'dart:io';
import 'package:boom_car/pages/host/step_5.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:boom_car/utils/validator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Step4 extends StatefulWidget {
  const Step4(
      {super.key,
      required this.carId,
      required this.city,
      required this.endDate,
      required this.startDate,
      required this.ownerName,
      required this.registrationNumber,
      required this.chasiNumber,
      required this.engineNumber,
      required this.type});
  final String carId;
  final String city;
  final String startDate;
  final String endDate;
  final String ownerName;
  final String registrationNumber;
  final String chasiNumber;
  final String engineNumber;
  final String type;
  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  File? _image;

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController driverNameCntrl = TextEditingController();
  final TextEditingController adharNumberCntrl = TextEditingController();
  final TextEditingController experienceCntrl = TextEditingController();

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
          child: Form(
            key: _formKey,
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
                  controller: driverNameCntrl,
                  validator: (value) => validator(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(alphaCharacters)
                  ],
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
                  controller: adharNumberCntrl,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
                    FilteringTextInputFormatter.allow(numberCharacter)
                  ],
                  validator: (value) => validator(value),
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
                  controller: experienceCntrl,
                  validator: (value) => validator(value),
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
                _image == null
                    ? GestureDetector(
                        onTap: pickImage,
                        child: DottedBorder(
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
                      )
                    : Container(
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: bottomSheetColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            _image!,
                            height: 210,
                            width: double.infinity,
                            fit: BoxFit.cover,
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
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step5(
                              chasiNumber: widget.chasiNumber,
                              engineNumber: widget.engineNumber,
                              ownerName: widget.ownerName,
                              registrationNumber: widget.registrationNumber,
                              type: widget.type,
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
