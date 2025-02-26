import 'package:boom_car/pages/host/step_3.dart';
import 'package:boom_car/services/host/all_cars.dart';
import 'package:boom_car/services/models/car_list.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:boom_car/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final _formKey = GlobalKey<FormState>();
  late List<CarIListModel> carList;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController cityCntrl = TextEditingController();
  final TextEditingController startDateCntrl = TextEditingController();
  final TextEditingController endDateCntrl = TextEditingController();
  String carId = '';
  final FocusNode _focusNode = FocusNode();
  Future<String>? carData;
  List<CarIListModel> filteredSuggestions = [];
  Future<String> getAllcars() async {
    carList = await CarListHost().carListHost();
    print('${carList[0].brandName} ${carList[0].model} ${carList[0].variant}');
    return '';
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _updateSuggestions();
    });
    carData = getAllcars();
  }

  @override
  void dispose() {
    _controller.dispose();
    cityCntrl.dispose();
    endDateCntrl.dispose();
    startDateCntrl.dispose();
    super.dispose();
  }

  void _updateSuggestions() {
    if (carData == null) {
      return;
    }
    String query = _controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredSuggestions = [];
      } else {
        filteredSuggestions = carList
            .where((brand) => brand.brandName!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void _selectSuggestion(
      {required String suggestion, required String carIdupdate}) {
    _controller.text = suggestion;
    carId = carIdupdate;
    setState(() {
      filteredSuggestions = [];
    });
    _focusNode.unfocus(); // Hide the keyboard
  }

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
                'Step 2 of 6',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Align(
                  alignment: Alignment(-0.3, 0),
                  child: Image.asset('assets/icons/ic_car.png')),
              LinearProgressIndicator(
                value: 0.4,
                minHeight: 3,
                backgroundColor: bottomSheetColor,
                valueColor: AlwaysStoppedAnimation<Color>(secondayColor),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset('assets/images/img_step2.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          controller: _controller,
                          validator: (value) => validator(value),
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            fillColor: bottomSheetColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: secondayColor,
                            ),
                            hintText: "Select Car",
                          ),
                        ),
                        FutureBuilder<String>(
                            future: carData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  constraints: BoxConstraints(maxHeight: 200),
                                  decoration: BoxDecoration(
                                    color: bottomSheetColor,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12, blurRadius: 5),
                                    ],
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: filteredSuggestions.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          '${filteredSuggestions[index].brandName!} ${filteredSuggestions[index].model}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                            filteredSuggestions[index]
                                                .variant!),
                                        onTap: () => _selectSuggestion(
                                            suggestion:
                                                '${filteredSuggestions[index].brandName!} ${filteredSuggestions[index].model}',
                                            carIdupdate:
                                                filteredSuggestions[index].id!),
                                      );
                                    },
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text("Something went wrong");
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: cityCntrl,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(alphaCharacters)
                  ],
                  validator: (value) => validator(value),
                  decoration: InputDecoration(
                      fillColor: bottomSheetColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: secondayColor,
                      ),
                      hintText: "Select City"),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Choose Sharing Date',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          print("clicked");
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
                              final startDate = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                              startDateCntrl.text =
                                  DateFormat('dd MMM h:mm a').format(startDate);
                              setState(() {});
                            }
                          }
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: startDateCntrl,
                          validator: (value) => validator(value),
                          decoration: InputDecoration(
                            fillColor: bottomSheetColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            prefixIcon:
                                Image.asset('assets/icons/ic_start_date.png'),
                            hintText: "Start Date",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
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
                              final endDate = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                              endDateCntrl.text =
                                  DateFormat('dd MMM h:mm a').format(endDate);
                              setState(() {});
                            }
                          }
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: endDateCntrl,
                          validator: (value) => validator(value),
                          decoration: InputDecoration(
                              fillColor: bottomSheetColor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              prefixIcon:
                                  Image.asset('assets/icons/ic_end_date.png'),
                              hintText: "End Date"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all(
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      minimumSize: WidgetStateProperty.all(
                          Size(double.infinity, 50)), // Set min size
                      maximumSize: WidgetStateProperty.all(
                          Size(double.infinity, 50)), // Set max size
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate() && mounted) {
                        print("data");
                        print(carId);
                        print(cityCntrl.text);
                        print(endDateCntrl.text);
                        print(startDateCntrl.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Step3(
                              carId: carId,
                              city: cityCntrl.text,
                              endDate: endDateCntrl.text,
                              startDate: startDateCntrl.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'NEXT',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
