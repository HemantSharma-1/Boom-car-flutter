import 'package:boom_car/pages/host/step_1.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class Host extends StatefulWidget {
  const Host({super.key});

  @override
  State<Host> createState() => _HostState();
}

class _HostState extends State<Host> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Host & Earn'),
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: secondayColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset('assets/images/img_host.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: bottomSheetColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: secondayColor, width: 2),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Boomcar Presents',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: secondayColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'A host service where you can list your cars along with the driver and start your earning',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'What makes us unique:',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: secondayColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: secondayColor,
                            ),
                            Expanded(child: Text('100% assurance policy')),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: secondayColor,
                            ),
                            Expanded(child: Text('Enhanced Protection')),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(
                              Size(320, 50)), // Set min size
                          maximumSize: WidgetStateProperty.all(
                              Size(320, 50)), // Set max size
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Step1(),
                            ),
                          );
                        },
                        child: Text('Add a Car'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Check your car earnings',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: secondayColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter car name to see details',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: secondayColor,
                    ),
                    hintText: 'Mahindra'),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Potential monethy earning ',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 16, color: Colors.white),
                  children: [
                    TextSpan(
                      text: '₹27000 - ₹30000',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: secondayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
