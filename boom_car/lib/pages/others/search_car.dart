import 'package:boom_car/pages/others/car_info.dart';
import 'package:boom_car/services/car_api/car_list.dart';
import 'package:boom_car/services/models/car_listing.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class SearchCars extends StatefulWidget {
  const SearchCars({
    super.key,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.doorStepDelivery,
  });
  final String city;
  final DateTime startDate;
  final DateTime endDate;
  final bool doorStepDelivery;
  @override
  State<SearchCars> createState() => _SearchCarsState();
}

class _SearchCarsState extends State<SearchCars>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  String type = "Self Drive";
  late List<CarListing> carListingWithoutDriver;
  late List<CarListing> carListingWithDriver;

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

  Future<String> getCarListWithoutDriver({required String type}) async {
    final storage = FlutterSecureStorage();
    // Check if token exists
    final token = await storage.read(key: 'authToken');
    carListingWithoutDriver = await CarList().carList(
        token: token!,
        state: widget.city,
        startDate: widget.startDate,
        endDate: widget.endDate,
        type: type,
        doorStepDelivery: widget.doorStepDelivery);
    return '';
  }

  Future<String> getCarListWithDriver({required String type}) async {
    final storage = FlutterSecureStorage();
    // Check if token exists
    final token = await storage.read(key: 'authToken');
    carListingWithDriver = await CarList().carList(
        token: token!,
        state: widget.city,
        startDate: widget.startDate,
        endDate: widget.endDate,
        type: type,
        doorStepDelivery: widget.doorStepDelivery);
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
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
        actions: [
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(6),
            height: 60,
            width: 310,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: secondayColor),
              color: bottomSheetColor,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<String>(
                        future: getCarListWithoutDriver(type: "Self Drive"),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              'Showing ${carListingWithoutDriver.length} cars in',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: 13),
                            );
                          } else if (snapshot.hasError) {
                            return Text('0');
                          } else {
                            return Container();
                          }
                        }),
                    Text(
                      widget.city,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14,
                          color: secondayColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  width: 120,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: secondayColor),
                    color: bottomSheetColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            DateFormat('dd MMM').format(widget.startDate),
                          ),
                          Text(
                            DateFormat('h a').format(widget.startDate),
                            style: TextStyle(color: Colors.white38),
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: secondayColor,
                      ),
                      Column(
                        children: [
                          Text(
                            DateFormat('dd MMM').format(widget.endDate),
                          ),
                          Text(
                            DateFormat('h a').format(widget.endDate),
                            style: TextStyle(color: Colors.white38),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final isSmallScreen = screenHeight < 600;

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                            constraints: BoxConstraints(maxHeight: 40),
                            contentPadding: EdgeInsets.all(0),
                            fillColor: bottomSheetColor,
                            hintText: "Search for feature,model",
                            hintStyle: TextStyle(color: Colors.white54),
                            border:
                                Theme.of(context).inputDecorationTheme.border)
                        .copyWith(
                      prefixIcon: Image.asset('assets/icons/ic_search.png'),
                      suffixIcon: Icon(
                        Icons.filter_alt_rounded,
                        color: secondayColor,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.filter_list_sharp),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TabBar.secondary(
              controller: _tabController,
              labelColor: secondayColor,
              indicatorColor: secondayColor,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.white,
              labelStyle: isSmallScreen
                  ? Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 12)
                  : Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 15),
              tabs: [
                Tab(
                  text: "WITHOUT DRIVER",
                ),
                Tab(
                  text: "WITH DRIVER",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  FutureBuilder<String>(
                    future: getCarListWithoutDriver(type: "Self Drive"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return WithoutDriver(
                          carListing: carListingWithoutDriver,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Something went wrong"),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: secondayColor,
                          ),
                        );
                      }
                    },
                  ),
                  FutureBuilder<String>(
                    future: getCarListWithDriver(type: "Self Drive"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return WithDriver(
                          carListing: carListingWithDriver,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Something went wrong"),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: secondayColor,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class WithDriver extends StatelessWidget {
  const WithDriver({super.key, required this.carListing});
  final List<CarListing> carListing;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carListing.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarInformation(
              id: carListing[index].id!,
            ),
          ),
        ),
        child: Cars(
          src: carListing[index].carImages!.coverImage!,
          carName:
              '${carListing[index].car!.brandName} ${carListing[index].car!.model} ${carListing[index].car!.year}',
          carType:
              '${carListing[index].car!.transmission} • ${carListing[index].car!.fuelType} • ${carListing[index].car!.seatCapacity} seats',
          price: carListing[index]
              .car!
              .pricing!
              .lessThan24H!
              .maxHourlyPrice
              .toString(),
          totalTrips: carListing[index].totalTripsCompleted.toString(),
          rating: carListing[index].ratingsAndReviews!.averageRating.toString(),
        ),
      ),
    );
  }
}

class Cars extends StatelessWidget {
  const Cars(
      {super.key,
      required this.src,
      required this.carName,
      required this.carType,
      required this.price,
      required this.totalTrips,
      required this.rating});
  final String src;
  final String carName;
  final String carType;
  final String price;
  final String totalTrips;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: secondayColor),
        color: bottomSheetColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              src,
              fit: BoxFit
                  .cover, // Ensures the image fills the container properly
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  carName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  carType,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white54),
                ),
              ),
              Container(
                height: 85,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: bottomSheetColor,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '₹$price/hr',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text('including taxes'),
                        Spacer(),
                        Column(
                          children: [
                            Icon(Icons.directions_walk_outlined),
                            Text('7.0 km away')
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 24,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: secondayColor),
                            color: bottomSheetColor,
                          ),
                          child: Center(
                            child: Text('FASTag Available'),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Image.asset('assets/icons/ic_markers.png'),
                            Text(totalTrips),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: secondayColor,
                            ),
                            Text(rating)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class WithoutDriver extends StatelessWidget {
  const WithoutDriver({super.key, required this.carListing});
  final List<CarListing> carListing;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carListing.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarInformation(
              id: carListing[index].id!,
            ),
          ),
        ),
        child: Cars(
          src: carListing[index].carImages!.coverImage!,
          carName:
              '${carListing[index].car!.brandName} ${carListing[index].car!.model} ${carListing[index].car!.year}',
          carType:
              '${carListing[index].car!.transmission} • ${carListing[index].car!.fuelType} • ${carListing[index].car!.seatCapacity} seats',
          price: carListing[index]
              .car!
              .pricing!
              .lessThan24H!
              .maxHourlyPrice
              .toString(),
          totalTrips: carListing[index].totalTripsCompleted.toString(),
          rating: carListing[index].ratingsAndReviews!.averageRating.toString(),
        ),
      ),
    );
  }
}
