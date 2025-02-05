import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class CarInformation extends StatefulWidget {
  const CarInformation({super.key});

  @override
  State<CarInformation> createState() => _CarInformationState();
}

class _CarInformationState extends State<CarInformation> {
  final ScrollController _scrollController = ScrollController();

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
                'Mahindra Scorpio N 2023',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white, fontSize: 14),
              ),
              Text(
                '26 Jan, 7PM - 27 Jan. 8AM',
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
            child: Column(
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
                    Text(
                      "Block-25, Sector 12,Moti Mahal,Delhi",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: secondayColor),
                    ),
                    Spacer(),
                    Icon(
                      Icons.star_rate,
                      color: secondayColor,
                      size: 16,
                    ),
                    Text(
                      '4.7',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: secondayColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("178 Reviews")
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                CarContainer(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Offers",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: secondayColor,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      "Reviews",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: secondayColor,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      "Location",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: secondayColor,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      "Features",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: secondayColor,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      "FAQ's",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: secondayColor,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                      mainAxisSize: MainAxisSize
                          .min, // Ensures the text doesn't take extra space
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
                SizedBox(
                  height: 20,
                ),
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
                      'Based on 20 Trips',
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
                RatingReviewWidget(),
                SizedBox(
                  height: 30,
                ),
                Review(),
                SizedBox(
                  height: 20,
                ),
                Review(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(bottomSheetColor),
                        foregroundColor:
                            WidgetStateProperty.all(secondayColor)),
                    onPressed: () {},
                    child: Text('View All 16 reviews'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: secondayColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: secondayColor),
                                SizedBox(width: 5),
                                Expanded(
                                  // Allows text to wrap properly
                                  child: Text(
                                    '#1033, Block 46, Moti mahal, beside Ram mandir, Delhi',
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.directions_walk_rounded,
                                    color: secondayColor),
                                SizedBox(width: 5),
                                Text(
                                  "7 Km",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Spacer(),
                                Text(
                                  "58 mins",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Spacer()
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Features",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: secondayColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 100,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 5, // Adds spacing between grid items
                      mainAxisSpacing: 0,
                      childAspectRatio: 4, // Adjust to keep Row items closer
                    ),
                    physics:
                        NeverScrollableScrollPhysics(), // Prevents nested scrolling
                    shrinkWrap: true, // Allows GridView to fit inside Column
                    itemCount: 4,
                    itemBuilder: (context, index) => Align(
                      // Align items properly
                      alignment: Alignment
                          .centerLeft, // Ensures content starts from left
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                10), // Adds padding inside the grid cells
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
                                overflow: TextOverflow
                                    .ellipsis, // Prevents text overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
            ),
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

class Review extends StatelessWidget {
  const Review({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bottomSheetColor,
      ),
      child: Column(
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
                    "Bhushan Kumar",
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
                      Text('4.5 out of 5 rating')
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'The car is an excellent condition.Brand new car with high quality performance.Highly Recommended.”“The car is an excellent condition.Brand new car with high quality performance.',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class RatingReviewWidget extends StatelessWidget {
  const RatingReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Column: Rating Summary
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '4.3',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/icons/ic_stars.png'),
            Text(
              "12,890 ratings",
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
                      value: 0.9,
                      minHeight: 10,
                      backgroundColor: bottomSheetColor,
                      borderRadius: BorderRadius.circular(15),
                      valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
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
                      value: 0.1,
                      minHeight: 10,
                      backgroundColor: bottomSheetColor,
                      borderRadius: BorderRadius.circular(15),
                      valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
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
                      value: 0.2,
                      minHeight: 10,
                      backgroundColor: bottomSheetColor,
                      borderRadius: BorderRadius.circular(15),
                      valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
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
                      value: 0.3,
                      minHeight: 10,
                      backgroundColor: bottomSheetColor,
                      borderRadius: BorderRadius.circular(15),
                      valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
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
                      value: 0.4,
                      minHeight: 10,
                      backgroundColor: bottomSheetColor,
                      borderRadius: BorderRadius.circular(15),
                      valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CarContainer extends StatelessWidget {
  const CarContainer({
    super.key,
  });

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
                              Text('Hosted By Bhadur',
                                  style:
                                      Theme.of(context).textTheme.displaySmall)
                            ],
                          ),
                          Text(
                            'Mahindra Scorpio N 2023',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Manual • Diesel • 4 seats',
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
                          '10 Trips',
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
                child: Image.asset(
                  'assets/images/img_car_interior_raw.png',
                  width: double.infinity,
                  fit: BoxFit
                      .cover, // Ensures the image fills the container properly
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
