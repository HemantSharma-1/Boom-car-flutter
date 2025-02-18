import 'package:boom_car/pages/host/step_3.dart';
import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<String> carBrands = [
    "Toyota",
    "Honda",
    "Ford",
    "BMW",
    "Mercedes",
    "Nissan",
    "Tesla",
    "Audi",
    "Chevrolet",
    "Hyundai"
  ];
  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _updateSuggestions();
    });
  }

  void _updateSuggestions() {
    String query = _controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredSuggestions = [];
      } else {
        filteredSuggestions = carBrands
            .where((brand) => brand.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void _selectSuggestion(String suggestion) {
    _controller.text = suggestion;
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
                      if (filteredSuggestions.isNotEmpty)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          constraints: BoxConstraints(maxHeight: 200),
                          decoration: BoxDecoration(
                            color: bottomSheetColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredSuggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(filteredSuggestions[index]),
                                onTap: () => _selectSuggestion(
                                    filteredSuggestions[index]),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
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
                    child: TextFormField(
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
                          prefixIcon:
                              Image.asset('assets/icons/ic_start_date.png'),
                          hintText: "Start Date"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
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
                          prefixIcon:
                              Image.asset('assets/icons/ic_end_date.png'),
                          hintText: "End Date"),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step3(),
                        ));
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
    );
  }
}
