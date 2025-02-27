import 'package:boom_car/pages/others/reviews.dart';
import 'package:boom_car/services/car_api/car_info.dart';
import 'package:boom_car/services/car_api/car_review.dart';
import 'package:boom_car/services/models/car_information.dart';
import 'package:boom_car/services/models/car_review.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CarInformation extends StatefulWidget {
  const CarInformation(
      {super.key,
      required this.id,
      required this.carName,
      required this.endDate,
      required this.startDate});
  final String id;
  final String carName;
  final String startDate;
  final String endDate;
  @override
  State<CarInformation> createState() => _CarInformationState();
}

class _CarInformationState extends State<CarInformation> {
  final ScrollController _scrollController = ScrollController();
  // Create GlobalKeys for each section
  final GlobalKey _offersKey = GlobalKey();
  final GlobalKey _reviewsKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  CarInformationModel? carInformation;
  List<CarReviewModel>? carReviewData;
  String selectedTitle = '';
  Future<String>? carInfo;
  Future<String>? reviewData;

  Future<String> getCarInfo() async {
    carInformation =
        await CarInformationService().carInformation(id: widget.id);
    print(carInformation!.ratingsAndReviews!.ratings!.values.elementAt(3));
    return '';
  }

  Future<String> getCarReview() async {
    final storage = FlutterSecureStorage();
    // Read value
    final token = await storage.read(key: 'authToken');
    carReviewData = await CarReview().carReview(id: widget.id, token: token!);
    return '';
  }

  // Function to scroll to a section
  void _scrollToSection(GlobalKey key, String title) {
    setState(() {
      selectedTitle = title;
    });
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    carInfo = getCarInfo();
    reviewData = getCarReview();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bottomSheetColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.carName,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white, fontSize: 14),
              ),
              Text(
                '${widget.startDate}-${widget.endDate}',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: secondayColor,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/icons/ic_heart.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.share,
                color: secondayColor,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: FutureBuilder<String>(
                future: carInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: secondayColor,
                              size: 12,
                            ),
                            Expanded(
                              child: Text(
                                carInformation!.carLocation!.location!,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: secondayColor),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.star_rate,
                              color: secondayColor,
                              size: 16,
                            ),
                            Text(
                              carInformation!.ratingsAndReviews!.averageRating
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: secondayColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "${carInformation!.ratingsAndReviews!.totalReviewsCount.toString()} Reviews",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CarContainer(
                          carInformation:
                              "${carInformation!.car!.transmission!} • ${carInformation!.car!.variant} • ${carInformation!.car!.seatCapacity}",
                          carName:
                              "${carInformation!.car!.brandName!} ${carInformation!.car!.model} ${carInformation!.car!.year}",
                          name: carInformation!.hostedBy!.name!,
                          trips: carInformation!.totalTripsCompleted.toString(),
                          images: carInformation!.carImages!,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _scrollToSection(_offersKey, "Offers"),
                              child: ScrollableTitle(
                                selectedTitle: selectedTitle,
                                title: "Offers",
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  _scrollToSection(_reviewsKey, "Reviews"),
                              child: ScrollableTitle(
                                selectedTitle: selectedTitle,
                                title: "Reviews",
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  _scrollToSection(_locationKey, "Location"),
                              child: ScrollableTitle(
                                selectedTitle: selectedTitle,
                                title: "Location",
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  _scrollToSection(_featuresKey, "Features"),
                              child: ScrollableTitle(
                                selectedTitle: selectedTitle,
                                title: "Features",
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  _scrollToSection(_featuresKey, "FAQ's"),
                              child: ScrollableTitle(
                                selectedTitle: selectedTitle,
                                title: "FAQ's",
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Sections with GlobalKeys
                        Container(key: _offersKey, child: OffersWidget()),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            key: _reviewsKey,
                            child: RatingReviewWidget(
                              rating: carInformation!
                                  .ratingsAndReviews!.averageRating
                                  .toString(),
                              ratings: carInformation!
                                  .ratingsAndReviews!.totalRatingsCount
                                  .toString(),
                              trips: carInformation!.totalTripsCompleted
                                  .toString(),
                              ratingSegragation:
                                  carInformation!.ratingsAndReviews!.ratings!,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FutureBuilder<Object>(
                          future: reviewData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap:
                                    true, // Ensures the ListView takes only the space it needs
                                physics:
                                    NeverScrollableScrollPhysics(), // Prevents the ListView from scrolling
                                itemCount: carReviewData!.length,
                                itemBuilder: (context, index) {
                                  return Review(
                                    name: carReviewData![index].user!.name!,
                                    rating:
                                        carReviewData![index].rating.toString(),
                                    review:
                                        carReviewData![index].review.toString(),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('Something went wrong');
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(bottomSheetColor),
                                foregroundColor:
                                    WidgetStateProperty.all(secondayColor)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewPage(
                                      carReviewData: carReviewData,
                                    ),
                                  ));
                            },
                            child: Text(
                                'View All ${carReviewData!.length} reviews'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            key: _locationKey,
                            child: CarLocationWidget(
                              location: carInformation!.carLocation!.location!,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(key: _featuresKey, child: Features()),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: bottomSheetColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/img_cross.png'),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cancellation Unavailable',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          fontSize: 14,
                                          color: secondayColor,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'This booking is non-refundable',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
        bottomSheet: BottomSheet(
          enableDrag: false,
          onClosing: () {},
          builder: (context) => Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            constraints: BoxConstraints(maxHeight: 80),
            decoration: BoxDecoration(
              color: bottomSheetColor,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24), bottom: Radius.zero),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹7,787',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: secondayColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '(including all taxes)',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 12),
                    )
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize:
                        WidgetStateProperty.all(Size(170, 39)), // Set min size
                    maximumSize:
                        WidgetStateProperty.all(Size(170, 39)), // Set max size
                  ),
                  child: Text(
                    'Pay Now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Features",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.bold, color: secondayColor, fontSize: 20),
        ),
        SizedBox(
          height: 100,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: 5, // Adds spacing between grid items
              mainAxisSpacing: 0,
              childAspectRatio: 5, // Adjust to keep Row items closer
            ),
            physics:
                NeverScrollableScrollPhysics(), // Prevents nested scrolling
            shrinkWrap: true, // Allows GridView to fit inside Column
            itemCount: 4,
            itemBuilder: (context, index) => Align(
              // Align items properly
              alignment:
                  Alignment.centerLeft, // Ensures content starts from left
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10), // Adds padding inside the grid cells
                child: Row(
                  children: [
                    Image.asset('assets/icons/ic_vector.png',
                        width: 30, height: 30), // Adjust size
                    SizedBox(width: 10),
                    Expanded(
                      // Ensures text doesn't overflow
                      child: Text(
                        'Spare tyres',
                        style: TextStyle(fontSize: 14),
                        overflow:
                            TextOverflow.ellipsis, // Prevents text overflow
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OffersWidget extends StatelessWidget {
  const OffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Exclusive Offers',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 22),
            ),
            Spacer(),
            Text(
              'View All',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18, color: secondayColor),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            fillColor: bottomSheetColor,
            hintText: "Enter Promo Code",
            suffixIcon: Row(
              mainAxisSize:
                  MainAxisSize.min, // Ensures the text doesn't take extra space
              children: [
                Text(
                  'APPLY',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CarLocationWidget extends StatelessWidget {
  const CarLocationWidget({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bottomSheetColor,
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 100, // Ensure it has height
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Car Location',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: secondayColor, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined, color: secondayColor),
                    SizedBox(width: 5),
                    Expanded(
                      // Allows text to wrap properly
                      child: Text(
                        location,
                        softWrap: true,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.directions_walk_rounded, color: secondayColor),
                    SizedBox(width: 5),
                    Text(
                      "7 Km",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Spacer(),
                    Text(
                      "58 mins",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Spacer()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Review extends StatelessWidget {
  const Review(
      {super.key,
      required this.name,
      required this.rating,
      required this.review});

  final String name;
  final String rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final screenHeight = MediaQuery.of(context).size.height;
      final isSmallScreen = screenHeight < 600;
      return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bottomSheetColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/icons/ic_stars.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('$rating out of 5 rating')
                      ],
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                review,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white, fontSize: isSmallScreen ? 10 : 12),
              ),
            )
          ],
        ),
      );
    });
  }
}

class RatingReviewWidget extends StatelessWidget {
  const RatingReviewWidget(
      {super.key,
      required this.rating,
      required this.ratings,
      required this.ratingSegragation,
      required this.trips});

  final String trips;
  final String rating;
  final String ratings;
  final Map<String, int> ratingSegragation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Rating & Reviews',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 22),
            ),
            Spacer(),
            Image.asset('assets/icons/ic_markers.png'),
            Text(
              'Based on $trips Trips',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            // Left Column: Rating Summary
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rating,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/icons/ic_stars.png'),
                Text(
                  "$ratings ratings",
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),

            SizedBox(width: 16), // Space between columns

            // Right Column: Progress Bar
            Expanded(
              // Allows the column to take up remaining space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "5",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        // Ensures progress bar takes full width
                        child: LinearProgressIndicator(
                          value: ratingSegragation.values.elementAt(4) != 0
                              ? ratingSegragation.values
                                      .elementAt(4)
                                      .toDouble() /
                                  double.parse(ratings)
                              : 0,
                          minHeight: 10,
                          backgroundColor: bottomSheetColor,
                          borderRadius: BorderRadius.circular(15),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(secondayColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "4",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: ratingSegragation.values.elementAt(3) != 0
                              ? ratingSegragation.values
                                      .elementAt(3)
                                      .toDouble() /
                                  double.parse(ratings)
                              : 0,
                          minHeight: 10,
                          backgroundColor: bottomSheetColor,
                          borderRadius: BorderRadius.circular(15),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(secondayColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "3",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: ratingSegragation.values.elementAt(2) != 0
                              ? ratingSegragation.values
                                      .elementAt(2)
                                      .toDouble() /
                                  double.parse(ratings)
                              : 0,
                          minHeight: 10,
                          backgroundColor: bottomSheetColor,
                          borderRadius: BorderRadius.circular(15),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(secondayColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "2",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: ratingSegragation.values.elementAt(1) != 0
                              ? ratingSegragation.values
                                      .elementAt(1)
                                      .toDouble() /
                                  double.parse(ratings)
                              : 0,
                          minHeight: 10,
                          backgroundColor: bottomSheetColor,
                          borderRadius: BorderRadius.circular(15),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(secondayColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "1",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: ratingSegragation.values.elementAt(0) != 0
                              ? ratingSegragation.values
                                      .elementAt(0)
                                      .toDouble() /
                                  double.parse(ratings)
                              : 0.0,
                          minHeight: 10,
                          backgroundColor: bottomSheetColor,
                          borderRadius: BorderRadius.circular(15),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(secondayColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CarContainer extends StatefulWidget {
  const CarContainer(
      {super.key,
      required this.carInformation,
      required this.carName,
      required this.name,
      required this.trips,
      required this.images});
  final String name;
  final String carName;
  final String carInformation;
  final String trips;
  final List<CarImage> images;
  @override
  State<CarContainer> createState() => _CarContainerState();
}

class _CarContainerState extends State<CarContainer> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bottomSheetColor,
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 85,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: bottomSheetColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Hosted By ${widget.name}',
                                  style:
                                      Theme.of(context).textTheme.displaySmall)
                            ],
                          ),
                          Text(
                            widget.carName,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.carInformation,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 35,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: secondayColor),
                        color: bottomSheetColor,
                      ),
                      child: Center(
                        child: Text(
                          '${widget.trips} Trips',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border.all(
                  color: secondayColor,
                ), // Ensures the border is visible
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(viewportFraction: 1),
                  controller: buttonCarouselController,
                  items: [
                    for (var image in widget.images)
                      Image.network(
                        image.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableTitle extends StatelessWidget {
  const ScrollableTitle(
      {super.key, required this.selectedTitle, required this.title});
  final String selectedTitle;
  final String title;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = MediaQuery.of(context).size.height;
        final isSmallScreen = screenHeight < 600;
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: selectedTitle == title
                ? Border(
                    bottom: BorderSide(color: secondayColor, width: 2),
                  )
                : null,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: selectedTitle == title ? secondayColor : Colors.white,
                fontSize: isSmallScreen ? 12 : 16),
          ),
        );
      },
    );
  }
}
