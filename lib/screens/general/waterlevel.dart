import 'package:flutter/material.dart';
import 'package:flutterui/screens/bottom_menu.dart';
import 'package:flutterui/screens/general/alert.dart';
import 'package:flutterui/screens/general/danger.dart';
import 'package:flutterui/screens/general/normal.dart';
import 'package:flutterui/screens/general/warning.dart';
import 'package:flutterui/screens/home_button.dart';

class WaterLevel extends StatefulWidget {
  const WaterLevel({Key? key}) : super(key: key);

  @override
  WaterLevelState createState() => WaterLevelState();
}

class WaterLevelState extends State<WaterLevel> {
  TextEditingController pointOfInterestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromRGBO(1, 39, 72, 1.0),
      body: ListView(
        children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Water Level',
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Danger()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 200, 0, 0),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/danger.png',
                          width: 80,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: Text('DANGER',
                            textScaleFactor: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Warning()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 213, 209, 0),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/warning.png',
                          width: 80,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: Text('WARNING',
                            textScaleFactor: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Alert()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 211, 81, 0),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/alert.png',
                          width: 80,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: Text('ALERT',
                            textScaleFactor: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   flex: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => const NormalList()),
          //         );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //             color: Color.fromARGB(255, 0, 200, 0),
          //             borderRadius: BorderRadius.circular(15)),
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Image.asset(
          //                 'assets/save.png',
          //                 width: 80,
          //               ),
          //             ),
          //             const Padding(
          //               padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
          //               child: Text('NORMAL',
          //                   textScaleFactor: 2,
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                   )),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(222, 5, 123, 119),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: pointOfInterestController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your point of interest',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Save the point of interest to your desired location
                        // ignore: unused_local_variable
                        String pointOfInterest = pointOfInterestController.text;
                        // save the point of interest
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MyHomeButton(),
    );
  }
}
