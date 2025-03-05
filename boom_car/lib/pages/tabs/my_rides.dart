import 'package:boom_car/pages/my_rides/my_rides_car_details.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

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
              labelColor: secondayColor,
              indicatorColor: secondayColor,
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5), // Adjust padding if needed
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.white, width: 1), // Custom bottom border
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
              padding: EdgeInsets.only(bottom: 5), // Adjust padding if needed
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.white, width: 1), // Custom bottom border
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
                  alignment: Alignment
                      .center, // Change to center for better positioning
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: bottomSheetColor,
                        border: Border.all(
                          color: selectedIndex == index
                              ? secondayColor
                              : Colors.grey,
                        ),
                      ),
                      child: Text('Last ${last[index]}'),
                    ),
                    if (selectedIndex == index)
                      Positioned(
                        right: -10, // Adjust position to move it fully outside
                        top: -10,
                        child: GestureDetector(
                          behavior: HitTestBehavior
                              .opaque, // Ensures tap is detected even outside image
                          onTap: () {
                            print("tapped");
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                          child: Container(
                            width: 30, // Expand the tap area
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
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RideCard(),
      ],
    );
  }
}

class RideCard extends StatelessWidget {
  const RideCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
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
                        Spacer(),
                        Image.asset('assets/icons/ic_progress.png'),
                        Text(
                          'Upcoming',
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
                      color: secondayColor,
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Image.asset('assets/icons/ic_map_pin.png'),
                        SizedBox(width: 5),
                        Text(
                          'Pickup Location: Block 10, Nabha',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '₹2,300',
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
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyRidesCarDetails(),
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
