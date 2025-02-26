import 'package:boom_car/pages/host/step_6.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class Step5 extends StatefulWidget {
  const Step5({
    super.key,
    required this.ownerName,
    required this.registrationNumber,
    required this.chasiNumber,
    required this.engineNumber,
    required this.type,
    required this.carId,
    required this.city,
    required this.startDate,
    required this.endDate,
  });
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
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final List<String> options = ["2  Hour", "3  Hour", "4  Hour", "5  Hour"];
  final List<String> durationOptions = [
    "30  Days",
    "40  Days",
    "60  Days",
    "No Limit"
  ];
  int selectedIndex = 3; // Default selected index (5 Hour)
  int selectedIndex1 = 1;
  int selectedIndex2 = 2;
  bool nightTimeBooking = true;
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
                'Step 5 of 6',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Align(
                  alignment: Alignment(0.8, 0),
                  child: Image.asset('assets/icons/ic_car.png')),
              LinearProgressIndicator(
                value: 0.9,
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
              Center(
                child: Image.asset('assets/images/img_step5.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Night Time Booking',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18),
                  ),
                  Switch(
                    value: nightTimeBooking,
                    onChanged: (val) {
                      setState(() {
                        nightTimeBooking = val;
                      });
                    },
                    trackColor: WidgetStateProperty.all(bottomSheetColor),
                    thumbColor: WidgetStateProperty.all(secondayColor),
                    activeThumbImage: AssetImage('assets/icons/ic_moon.png'),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('Enable whether night time booking available'),
              SizedBox(
                height: 40,
              ),
              Text(
                'Set minimum booking duration',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Enable whether night time booking available'),
              SizedBox(
                height: 5,
              ),
              GridView.builder(
                shrinkWrap:
                    true, // Ensures GridView does not take infinite height
                physics:
                    NeverScrollableScrollPhysics(), // Disables scrolling inside GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 5, // Adjusts height-to-width ratio
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                      decoration: BoxDecoration(
                        color: bottomSheetColor, // Background color
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        border: Border.all(
                          color: isSelected
                              ? secondayColor
                              : Colors.transparent, // Border color
                          width: isSelected
                              ? 2
                              : 1, // Thicker border for selected button
                        ),
                      ),
                      child: Center(
                        child: Text(
                          options[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Set inter- minimum booking duration',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Enable whether night time booking available'),
              SizedBox(
                height: 5,
              ),
              GridView.builder(
                shrinkWrap:
                    true, // Ensures GridView does not take infinite height
                physics:
                    NeverScrollableScrollPhysics(), // Disables scrolling inside GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 5, // Adjusts height-to-width ratio
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex1;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex1 = index;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                      decoration: BoxDecoration(
                        color: bottomSheetColor, // Background color
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        border: Border.all(
                          color: isSelected
                              ? secondayColor
                              : Colors.transparent, // Border color
                          width: isSelected
                              ? 2
                              : 1, // Thicker border for selected button
                        ),
                      ),
                      child: Center(
                        child: Text(
                          options[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Set maximum booking duration',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Enable whether night time booking available'),
              SizedBox(
                height: 5,
              ),
              GridView.builder(
                shrinkWrap:
                    true, // Ensures GridView does not take infinite height
                physics:
                    NeverScrollableScrollPhysics(), // Disables scrolling inside GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 5, // Adjusts height-to-width ratio
                ),
                itemCount: durationOptions.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedIndex2;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex2 = index;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                      decoration: BoxDecoration(
                        color: bottomSheetColor, // Background color
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        border: Border.all(
                          color: isSelected
                              ? secondayColor
                              : Colors.transparent, // Border color
                          width: isSelected
                              ? 2
                              : 1, // Thicker border for selected button
                        ),
                      ),
                      child: Center(
                        child: Text(
                          durationOptions[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  );
                },
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
                          builder: (context) => Step6(
                            carId: widget.carId,
                            chasiNumber: widget.chasiNumber,
                            city: widget.city,
                            endDate: widget.endDate,
                            engineNumber: widget.engineNumber,
                            ownerName: widget.ownerName,
                            registrationNumber: widget.registrationNumber,
                            startDate: widget.startDate,
                            type: widget.type,
                            interminimumBookingDuration:
                                options[selectedIndex1].split(' ')[0],
                            maximumBookingDuration:
                                durationOptions[selectedIndex2].split(' ')[0],
                            minimumBookingDuration:
                                options[selectedIndex].split(' ')[0],
                            nightTimeBooking: nightTimeBooking,
                          ),
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
