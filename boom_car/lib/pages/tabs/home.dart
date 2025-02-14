import 'package:boom_car/pages/others/search_car.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BoomCar",
          style: TextStyle(
            color: secondayColor,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookRide(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Categories",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CategoryWidget(
                    imgScr: 'assets/images/img_car_category.png',
                    text: 'Without Driver',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryWidget(
                    imgScr: 'assets/images/img_car_category.png',
                    text: 'With Driver',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryWidget(
                    imgScr: 'assets/images/img_car_category.png',
                    text: 'With Driver',
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: CarouselSlider(
                      options: CarouselOptions(viewportFraction: 1),
                      controller: buttonCarouselController,
                      items: [
                        Image.asset('assets/images/img_sale.png'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Navigation Arrows
                      IconButton(
                        onPressed: () {
                          buttonCarouselController.previousPage();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          buttonCarouselController.nextPage();
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.imgScr, required this.text});
  final String imgScr;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      decoration: BoxDecoration(
        color: bottomSheetColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgScr),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: secondayColor, fontSize: 8),
          )
        ],
      ),
    );
  }
}

class BookRide extends StatefulWidget {
  const BookRide({
    super.key,
  });

  @override
  State<BookRide> createState() => _BookRideState();
}

class _BookRideState extends State<BookRide> {
  final TextEditingController cityCntrl = TextEditingController(text: "Mumbai");
  late DateTime startDate = DateTime(2025, 1, 21);
  late DateTime endDate = DateTime(2025, 1, 25);
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bottomSheetColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Book a Ride",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Fill details & Search Car for your Destination",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: cityCntrl,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder!
                      .borderSide,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder!
                      .borderSide,
                ),
                prefixIcon: Image.asset('assets/icons/ic_search.png'),
                suffixIcon: Image.asset('assets/icons/ic_location.png')),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null && mounted) {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        startDate = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        setState(() {});
                      }
                    }
                  },
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: secondayColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Start Date'),
                        Text(
                          DateFormat('MMM dd, yyyy h:mm a').format(startDate),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null && mounted) {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        endDate = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        setState(() {});
                      }
                    }
                  },
                  child: Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: secondayColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('End Date'),
                        Text(
                          DateFormat('MMM dd, yyyy h:mm a').format(endDate),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: value,
                activeColor: secondayColor,
                overlayColor: WidgetStateProperty.all(secondayColor),
                shape: CircleBorder(side: BorderSide(color: secondayColor)),
                onChanged: (change) {
                  setState(() {
                    value = change!;
                  });
                },
              ),
              Text('Delivery & Pick-up from anywhere')
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchCars(
                    city: cityCntrl.text,
                    doorStepDelivery: value,
                    endDate: endDate,
                    startDate: startDate,
                  ),
                ),
              ),
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: WidgetStateProperty.all(
                  Size(250, 40),
                ),
              ),
              child: Text('Search Car'),
            ),
          )
        ],
      ),
    );
  }
}
