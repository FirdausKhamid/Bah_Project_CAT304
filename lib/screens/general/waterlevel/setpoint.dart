import 'package:flutter/material.dart';
import 'package:flutterui/screens/widgets/bottom_menu.dart';
import 'package:flutterui/screens/widgets/home_button.dart';

class SetPoint extends StatefulWidget {
  const SetPoint({super.key});

  @override
  State<SetPoint> createState() => _SetPointState();
}

class _SetPointState extends State<SetPoint> {
  final TextEditingController _pointOfInterestController =
      TextEditingController();
  final List<String> _pointsOfInterest = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: _pointOfInterestController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your point of interest',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Save the point of interest to your desired location
                    String pointOfInterest = _pointOfInterestController.text;
                    _pointsOfInterest.add(pointOfInterest);
                    // save the point of interest
                    print(pointOfInterest);
                  },
                  child: const Text('Save'),
                ),
              ),
              // Container(
              //   child: ListView.builder(
              //       itemCount: _pointsOfInterest.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Text(_pointsOfInterest[index]);
              //       }),
              // ),
            ],
          ),
        ),
      ),

      // ]),
      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}
