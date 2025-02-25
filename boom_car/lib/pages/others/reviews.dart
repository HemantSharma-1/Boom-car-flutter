import 'package:boom_car/pages/others/car_info.dart';
import 'package:boom_car/services/models/car_review.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.carReviewData});
  final List<CarReviewModel>? carReviewData;
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: secondayColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'All Reviews',
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.carReviewData!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Review(
            name: widget.carReviewData![index].user!.name!,
            rating: widget.carReviewData![index].rating.toString(),
            review: widget.carReviewData![index].review.toString(),
          ),
        ),
      ),
    );
  }
}
