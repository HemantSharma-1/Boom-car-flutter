import 'package:boom_car/pages/my_rides/car_image.dart';
import 'package:boom_car/pages/my_rides/return_car.dart';
import 'package:boom_car/services/api/guest/detail_guest_booking.dart';
import 'package:boom_car/services/models/my_ride_details.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class _HostDetails extends StatelessWidget {
  final GetMyRidesDetails carDetails;

  const _HostDetails({
    required this.carDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Host Details',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: myRidesColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
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
              carDetails.booking!.hostedBy!.name!,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
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
                      color: myRidesColor,
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    Icons.call,
                    color: myRidesColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Call Now",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
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
                      color: myRidesColor,
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
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _CarRating extends StatefulWidget {
  const _CarRating();

  @override
  State<_CarRating> createState() => _CarRatingState();
}

class _CarRatingState extends State<_CarRating> {
  double carRating = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'You rated this car:',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 10),
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
            setState(() {
              carRating = rating;
            });
          },
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            '$carRating stars',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}

class _ExtendRide extends StatefulWidget {
  const _ExtendRide();

  @override
  State<_ExtendRide> createState() => _ExtendRideState();
}

class _ExtendRideState extends State<_ExtendRide> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Extend Ride",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Switch(
              value: switchState,
              activeColor: myRidesColor,
              onChanged: (val) {
                setState(() {
                  switchState = !switchState;
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
        SizedBox(height: 10),
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
        SizedBox(height: 10),
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
              foregroundColor: WidgetStateProperty.all(myRidesColor),
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
      ],
    );
  }
}

class _FAQ extends StatefulWidget {
  const _FAQ();

  @override
  State<_FAQ> createState() => _FAQState();
}

class _FAQState extends State<_FAQ> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Frequently Asked Questions (FAQ's)",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: myRidesColor,
                  fontSize: 17,
                ),
          ),
        ),
        SizedBox(height: 10),
        !selected
            ? Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: bottomSheetColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      "Is this booking non-refundable",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Is this booking non-refundable",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = false;
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_up_rounded),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Loren ipsem is simpl dummy text of the printin and typesetting industry',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 12,
                          ),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

class MyRidesCarDetails extends StatefulWidget {
  const MyRidesCarDetails({super.key, required this.bookingId});
  final String bookingId;
  @override
  State<MyRidesCarDetails> createState() => _MyRidesCarDetailsState();
}

class _MyRidesCarDetailsState extends State<MyRidesCarDetails> {
  bool selected = false;
  GetMyRidesDetails? carDetails;
  Future<String>? carDetailvar;

  String _formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy (hh:mm a)').format(date);
  }

  Future<String> carDetail() async {
    final storage = FlutterSecureStorage();
    // Check if token exists
    final token = await storage.read(key: 'authToken');
    carDetails = await DetailGuestBooking()
        .detailGuestBooking(token: token!, id: widget.bookingId);
    return '';
  }

  @override
  void initState() {
    carDetailvar = carDetail();
    super.initState();
  }

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
            color: myRidesColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Object>(
            future: carDetailvar,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          carDetails!.booking!.carListing!.coverImage!,
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
                            carDetails!.booking!.carListing!.carName!,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'License Number: ${carDetails!.booking!.carListing!.registrationNumber!}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 12),
                          ),
                          SizedBox(height: 2),
                          Divider(
                            color: myRidesColor,
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Image.asset('assets/icons/ic_clock.png'),
                              SizedBox(width: 5),
                              Text(
                                '${_formatDate(carDetails!.booking!.startDate!)} - ${_formatDate(carDetails!.booking!.endDate!)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Divider(
                            color: myRidesColor,
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Image.asset('assets/icons/ic_map_pin.png'),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  'Pickup Location: ${carDetails!.booking!.carListing!.carLocation!}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Total Cost: ₹${carDetails!.booking!.totalAmount}',
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
                                    .copyWith(
                                        color: Colors.white, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset('assets/icons/ic_hourglass.png'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                carDetails!.booking!.bookingStatus!,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          _HostDetails(carDetails: carDetails!),
                          SizedBox(height: 10),
                          if (carDetails!.booking!.bookingStatus! ==
                              'completed')
                            _CarRating(),
                          SizedBox(height: 10),
                          if (carDetails!.booking!.bookingStatus! == 'ongoing')
                            _ExtendRide(),
                          SizedBox(height: 20),
                          if (carDetails!.booking!.bookingStatus! !=
                              'completed')
                            _FAQ(),
                          SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: secondayColor,
                  ),
                );
              }
            }),
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
                    backgroundColor: WidgetStateProperty.all(myRidesColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarImageScreen(
                            bookingId: carDetails!.booking!.id!,
                          ),
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
