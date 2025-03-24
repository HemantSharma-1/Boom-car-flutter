import 'package:boom_car/pages/my_rides/car_image.dart';
import 'package:boom_car/pages/my_rides/return_car.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRidesCarDetails extends StatefulWidget {
  const MyRidesCarDetails({super.key});

  @override
  State<MyRidesCarDetails> createState() => _MyRidesCarDetailsState();
}

class _MyRidesCarDetailsState extends State<MyRidesCarDetails> {
  bool selected = false;
  bool switchState = false;
  double carRating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Car details",
        ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/img_thar.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mahindra Thar',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'License Numvber: MA 123 12',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 12),
                  ),
                  SizedBox(height: 2),
                  Divider(
                    color: secondayColor,
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Image.asset('assets/icons/ic_clock.png'),
                      SizedBox(width: 5),
                      Text(
                        'Feb 12 (7PM) - Feb 28 (8PM)',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Divider(
                    color: secondayColor,
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Image.asset('assets/icons/ic_map_pin.png'),
                      SizedBox(width: 5),
                      Text(
                        'Pickup Location: Block 10, Nabha',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Total Cost: ₹2,300',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' (Including all taxes)',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Status:',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/icons/ic_hourglass.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Ongoing',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Host Details',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: secondayColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Aman Vidrohi',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: secondayColor,
                                width: 2.0,
                              ),
                            ),
                            child: Icon(
                              Icons.call,
                              color: secondayColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Call Now",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: secondayColor,
                                width: 2.0,
                              ),
                            ),
                            child: Image.asset('assets/icons/ic_whatsApp.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "WhatsApp",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'You rated this car:',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 17),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {});
                      print(rating);
                      carRating = rating;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '$carRating stars',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Extend Ride",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Switch(
                        value: switchState,
                        activeColor: secondayColor,
                        onChanged: (val) {
                          setState(() {
                            !switchState
                                ? switchState = true
                                : switchState = false;
                          });
                        },
                      )
                    ],
                  ),
                  Text(
                    "By enabling this you are requesting to extend the ride according to the days you will enter",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      fillColor: bottomSheetColor,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Select Date",
                      prefixIcon: Image.asset('assets/icons/ic_calendar.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        foregroundColor: WidgetStateProperty.all(secondayColor),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReturnCar(),
                          ),
                        );
                      },
                      child: Text("Extend Ride"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Frequently Asked Questions (FAQ's)",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: secondayColor,
                            fontSize: 17,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  !selected
                      ? Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: bottomSheetColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Text("Is this booking non-refundable",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = true;
                                  });
                                },
                                child: Icon(Icons.keyboard_arrow_down_rounded),
                              )
                            ],
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: bottomSheetColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Is this booking non-refundable",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selected = false;
                                      });
                                    },
                                    child:
                                        Icon(Icons.keyboard_arrow_up_rounded),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Loren ipsem is simpl dummy text of the printin and typesetting industry',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontSize: 12,
                                    ),
                              )
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.black,
        enableDrag: false,
        onClosing: () {},
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.all(
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarImageScreen(),
                        ));
                  },
                  child: Text(
                    'START RIDE',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
