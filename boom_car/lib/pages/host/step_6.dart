import 'dart:io';
import 'package:boom_car/pages/host/under_verification_screen.dart';
import 'package:boom_car/services/car_api/add_car.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

class Step6 extends StatefulWidget {
  const Step6(
      {super.key,
      required this.carId,
      required this.city,
      required this.endDate,
      required this.startDate,
      required this.chasiNumber,
      required this.engineNumber,
      required this.ownerName,
      required this.registrationNumber,
      required this.type,
      required this.nightTimeBooking,
      required this.minimumBookingDuration,
      required this.interminimumBookingDuration,
      required this.maximumBookingDuration,
      this.adharCard,
      this.driverName,
      this.driverProfilePicture,
      this.experience});
  final String carId;
  final String city;
  final String startDate;
  final String endDate;
  final bool nightTimeBooking;
  final String minimumBookingDuration;
  final String interminimumBookingDuration;
  final String maximumBookingDuration;
  final String ownerName;
  final String registrationNumber;
  final String chasiNumber;
  final String engineNumber;
  final String type;
  final String? driverName;
  final String? adharCard;
  final String? experience;
  final String? driverProfilePicture;

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  File? _coverImage;
  final ImagePicker _picker = ImagePicker();
  int exteriorLimit = 5;
  final List<File> _selectedExternalImages = [];
  final List<File> _selectedExteriorWithLicensePlate = [];
  final List<File> _selectedInteriorImages = [];

  Future<void> uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _coverImage = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadExteriorImage() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      limit: 5,
    );

    if (pickedFiles != null) {
      setState(() {
        exteriorLimit -= _selectedExternalImages.length;
        _selectedExternalImages.addAll(
          pickedFiles.map((file) => File(file.path)),
        );
      });
    }
  }

  Future<void> uploadInteriorImage() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      limit: 5,
    );

    if (pickedFiles != null) {
      setState(() {
        exteriorLimit -= _selectedInteriorImages.length;
        _selectedInteriorImages.addAll(
          pickedFiles.map((file) => File(file.path)),
        );
      });
    }
  }

  Future<void> uploadExteriorImageWithLicense() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      limit: 5,
    );

    if (pickedFiles != null) {
      setState(() {
        exteriorLimit -= _selectedExteriorWithLicensePlate.length;
        _selectedExteriorWithLicensePlate.addAll(
          pickedFiles.map((file) => File(file.path)),
        );
      });
    }
  }

  Future<void> uploadHostData() async {
    final storage = FlutterSecureStorage();
    // Read value
    final token = await storage.read(key: 'authToken');
    final response = await AddCarApi().addCarApi(
        token: token!,
        carId: widget.carId,
        city: widget.city,
        location: widget.city,
        startDate: widget.startDate,
        endDate: widget.endDate,
        ownerName: widget.ownerName,
        registerationNumber: widget.registrationNumber,
        chasiNumber: widget.chasiNumber,
        engineNumber: widget.engineNumber,
        type: widget.type,
        nightbookAvailability: widget.nightTimeBooking,
        minimumBookingDuration: widget.minimumBookingDuration,
        interBookingDuration: widget.interminimumBookingDuration,
        maximumBookingDuration: widget.maximumBookingDuration,
        rcImage: _coverImage!,
        coverImage: _coverImage!,
        exteriorImages: _selectedExternalImages,
        interiorImages: _selectedInteriorImages,
        exteriorWithLicensePlateImages: _selectedExteriorWithLicensePlate);

    if (response["success"] && mounted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UnderVerificationScreen(),
          ));
    }
  }

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
              GestureDetector(
                onTap: uploadImage,
                child: Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bottomSheetColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _coverImage == null
                      ? Column(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: secondayColor),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            _coverImage!,
                            height: 210,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (_selectedExternalImages.isNotEmpty)
                      for (var image in _selectedExternalImages)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    if (_selectedExternalImages.length < 5)
                      GestureDetector(
                        onTap: uploadExteriorImage,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: secondayColor),
                              ),
                            ],
                          ),
                        ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (_selectedInteriorImages.isNotEmpty)
                      for (var image in _selectedInteriorImages)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    if (_selectedInteriorImages.length < 5)
                      GestureDetector(
                        onTap: uploadInteriorImage,
                        child: Container(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: secondayColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Exterior  Images (With License plate)',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (_selectedExteriorWithLicensePlate.isNotEmpty)
                      for (var image in _selectedExteriorWithLicensePlate)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    if (_selectedExteriorWithLicensePlate.length < 5)
                      GestureDetector(
                        onTap: uploadExteriorImageWithLicense,
                        child: Container(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: secondayColor),
                              ),
                            ],
                          ),
                        ),
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
                    uploadHostData();
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
