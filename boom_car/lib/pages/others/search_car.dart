import 'package:boom_car/pages/others/car_info.dart';
import 'package:boom_car/services/car_api/car_list.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  Future<String> getCarList() async {
    final storage = FlutterSecureStorage();
    // Check if token exists
    final token = await storage.read(key: 'authToken');
    final data = CarList().carList(
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
                    Text(
                      'Showing 7 cars in',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 13),
                    ),
                    Text(
                      "Chandigarh",
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
                          Text("26 Jan"),
                          Text(
                            "7 PM",
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
                          Text("27 Jan"),
                          Text(
                            "8 PM",
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final isSmallScreen = screenHeight < 600;
          return FutureBuilder<String>(
              future: getCarList(),
              builder: (context, snapshot) {
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
                                    border: Theme.of(context)
                                        .inputDecorationTheme
                                        .border)
                                .copyWith(
                              prefixIcon:
                                  Image.asset('assets/icons/ic_search.png'),
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
                          WithoutDriver(),
                          WithDriver(),
                        ],
                      ),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}

class WithDriver extends StatelessWidget {
  const WithDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarInformation(),
            )),
        child: Cars(),
      ),
    );
  }
}

class Cars extends StatelessWidget {
  const Cars({
    super.key,
  });

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
            child: Image.asset(
              'assets/images/img_car_interior_raw.png',
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
                  'Mahindra Scorpio 2023',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Manual • Diesel • 4 seats',
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
                          "₹800/hr",
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
                          width: 115,
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
                            Text("7 Trips"),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: secondayColor,
                            ),
                            Text("4.9")
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
  const WithoutDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarInformation(),
          ),
        ),
        child: Cars(),
      ),
    );
  }
}
