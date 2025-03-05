import 'package:boom_car/pages/my_rides/car_image.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class MyRidesCarDetails extends StatefulWidget {
  const MyRidesCarDetails({super.key});

  @override
  State<MyRidesCarDetails> createState() => _MyRidesCarDetailsState();
}

class _MyRidesCarDetailsState extends State<MyRidesCarDetails> {
  bool selected = false;

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
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        enableDrag: false,
        onClosing: () {},
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                                child: Icon(Icons.keyboard_arrow_up_rounded),
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
