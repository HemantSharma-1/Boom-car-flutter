import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class CarInformation extends StatefulWidget {
  const CarInformation({super.key});

  @override
  State<CarInformation> createState() => _CarInformationState();
}

class _CarInformationState extends State<CarInformation> {
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
            child: Column(
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
                Container(
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
                        children: [CarContainer()],
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
                )
              ],
            ),
          ),
        ),
      ),
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
      height: 85,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                    Text(
                      'Hosted By Bhadur',
                      style:
                          Theme.of(context).textTheme.displaySmall!.copyWith(),
                    )
                  ],
                ),
                Text(
                  'Mahindra Scorpio N 2023',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Manual • Diesel • 4 seats',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(),
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
              child: Text('10 Trips'),
            ),
          ),
        ],
      ),
    );
  }
}
