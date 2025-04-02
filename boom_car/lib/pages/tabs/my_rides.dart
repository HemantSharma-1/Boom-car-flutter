import 'package:boom_car/pages/my_rides/my_rides_car_details.dart';
import 'package:boom_car/services/api/guest/guest_booking.dart';
import 'package:boom_car/services/models/my_rides.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class MyRide extends StatefulWidget {
  const MyRide({super.key});

  @override
  State<MyRide> createState() => _MyRideState();
}

class _MyRideState extends State<MyRide> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Trips"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar.secondary(
              controller: _tabController,
              labelColor: myRidesColor,
              indicatorColor: myRidesColor,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.white,
              labelStyle: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 15),
              tabs: [
                Tab(
                  text: "Current Rides",
                ),
                Tab(
                  text: "Previous Rides",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  RidesWidget(),
                  RidesWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RidesWidget extends StatefulWidget {
  const RidesWidget({
    super.key,
  });

  @override
  State<RidesWidget> createState() => _RidesWidgetState();
}

class _RidesWidgetState extends State<RidesWidget> {
  final List<String> last = ["7 Days", "30 Days", "6 month"];
  int selectedIndex = 3;
  GetMyRides? myRides;
  Future<String> getTrips() async {
    final storage = FlutterSecureStorage();
    // Check if token exists
    final token = await storage.read(key: 'authToken');
    myRides = await GuestBooking().guestBooking(token: token!);
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: getTrips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/ic_calendar.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Enter Starting Date',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "To",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/ic_endCalendar.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Enter Ending Date',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 25,
                  child: ListView.builder(
                    itemCount: last.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: bottomSheetColor,
                              border: Border.all(
                                color: selectedIndex == index
                                    ? myRidesColor
                                    : Colors.grey,
                              ),
                            ),
                            child: Text('Last ${last[index]}'),
                          ),
                          if (selectedIndex == index)
                            Positioned(
                              right: -10,
                              top: -10,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 4;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/icons/ic_cancel.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RideCard(
                  data: myRides!,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('something went wrong'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: secondayColor,
              ),
            );
          }
        });
  }
}

class RideCard extends StatelessWidget {
  const RideCard({super.key, required this.data});
  final GetMyRides data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.bookings!.length,
        itemBuilder: (context, index) => Card(
          color: Colors.black,
          margin: EdgeInsets.only(bottom: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    data.bookings![index].carListing!.coverImage!,
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
                      data.bookings![index].carListing!.carName!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
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
                          '${DateFormat('MMM dd (ha)').format(data.bookings![index].startDate!)} - ${DateFormat('MMM dd (ha)').format(data.bookings![index].endDate!)}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        Spacer(),
                        Image.asset('assets/icons/ic_progress.png'),
                        Text(
                          data.bookings![index].bookingStatus!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
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
                            'Pickup Location: ${data.bookings![index].carListing!.carLocation!}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '₹${data.bookings![index].tripAmount}',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
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
                            backgroundColor:
                                WidgetStateProperty.all(myRidesColor)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyRidesCarDetails(
                                  bookingId: data.bookings![index].id!,
                                ),
                              ));
                        },
                        child: Text(
                          'View Details',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
