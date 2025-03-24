import 'dart:io';

import 'package:boom_car/pages/my_rides/my_rides_otp.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CarImageScreen extends StatefulWidget {
  const CarImageScreen({super.key});

  @override
  State<CarImageScreen> createState() => _CarImageScreenState();
}

class _CarImageScreenState extends State<CarImageScreen> {
  bool isImageUploaded = false;
  final ImagePicker _picker = ImagePicker();
  final List<File> _image = [];

  Future<void> pickImage() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      limit: 5,
    );

    if (pickedFiles != null) {
      setState(() {
        _image.addAll(
          pickedFiles.map((file) => File(file.path)),
        );
        isImageUploaded = true;
      });
    }
  }

  // Function to pick an image from the gallery
  Future<void> uploadImage() async {
    bool continueCapturing = true;

    while (continueCapturing) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _image.add(File(pickedFile.path));
          isImageUploaded = true;
        });

        // Ask user if they want to take another photo
        if (_image.length < 4) {
          continueCapturing = await _showCaptureMoreDialog();
        } else {
          continueCapturing = false;
        }
      } else {
        continueCapturing = false;
      }
    }
  }

// Dialog to ask user if they want to take another picture
  Future<bool> _showCaptureMoreDialog() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Capture Another?"),
            content: Text("Do you want to take another photo?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("No"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text("Yes"),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Car Images",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: secondayColor,
                  fontSize: 17,
                )),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: secondayColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/img_step1.png'),
              ),
              SizedBox(
                height: 20,
              ),
              !isImageUploaded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pickImage();
                          },
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
                                children: [
                                  Image.asset('assets/icons/ic_uploader.png'),
                                  Text(
                                    'Upload Media',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: secondayColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'choose files from Gallery',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              minimumSize: WidgetStateProperty.all(
                                  Size(double.infinity, 50)), // Set min size
                              maximumSize: WidgetStateProperty.all(
                                  Size(double.infinity, 50)), // Set max size
                              textStyle: WidgetStateProperty.all(
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            onPressed: uploadImage,
                            child: Text(
                              'OPEN CAMERA',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Instructions:',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: secondayColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: secondayColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Upload photos of car from 4 different angles',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 16,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2 images per row
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.5,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _image.length < 4
                                ? _image.length + 1
                                : _image.length,
                            itemBuilder: (context, index) {
                              if (index == _image.length && _image.length < 4) {
                                // Add Photo button
                                return GestureDetector(
                                  onTap: () {
                                    pickImage();
                                  },
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
                                        children: [
                                          Image.asset(
                                              'assets/icons/ic_uploader.png'),
                                          Text(
                                            'Upload Media',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: secondayColor),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'choose files from Gallery',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                // Display images
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 120,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      color: bottomSheetColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.file(
                                        _image[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              minimumSize: WidgetStateProperty.all(
                                  Size(double.infinity, 50)), // Set min size
                              maximumSize: WidgetStateProperty.all(
                                  Size(double.infinity, 50)), // Set max size
                              textStyle: WidgetStateProperty.all(
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyRidesVerifyOtp(),
                                ),
                              );
                            },
                            child: Text(
                              'NEXT',
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
