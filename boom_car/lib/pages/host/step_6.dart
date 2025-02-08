import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class Step6 extends StatefulWidget {
  const Step6({super.key});

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: secondayColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: SizedBox(
          width: 180,
          child: Column(
            children: [
              Text(
                'Step 6 of 6',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Align(
                  alignment: Alignment(1, 0),
                  child: Image.asset('assets/icons/ic_car.png')),
              LinearProgressIndicator(
                value: 1,
                minHeight: 3,
                backgroundColor: bottomSheetColor,
                valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
