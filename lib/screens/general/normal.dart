import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/screens/bottom_menu.dart';
import 'package:flutterui/screens/home_button.dart';

// class _Normal extends State<Normal> {
//   const Normal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Location'),
//       ),

//       // Start : Contents Placeholder

//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.only(top: 15.0),
//         child: Column(children: [Text("Display Text")]),
//       )),

//       // End : Contents Placeholder

//       bottomNavigationBar: MyBottomMenuNavigationBar(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: MyHomeButton(),
//     );
//   }
// }

class NormalList extends StatefulWidget {
  const NormalList({super.key});

  @override
  State<NormalList> createState() => NormalListState();
}

class NormalListState extends State<NormalList> {
  // // Referencing Database
  // String _displayText = 'Results go here';
  // final _database = FirebaseDatabase.instance.reference().child('https://bah--application-default-rtdb.asia-southeast1.firebasedatabase.app/normal/-NLMu2GkBcFSHXqnPJQM/data/0');
  final ref = FirebaseDatabase.instance.ref();
  Future<void> fetch_fb() async {
    // List<Object> predictions = [];

    var snapshot = await ref.child('normal').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print("NOOOOOOO O OO ");
    }
    // setSpot(latest_price, predictions);
  }

  @override
  void initState() {
    super.initState();
    fetch_fb();
  }

  // // Initializing active listeners
  // void initState() {
  //   super.initState();
  //   _activateListeners();
  // }

  // // Active listeners : To detect changes from the codes
  // void _activateListeners() {
  //   _database
  //       .child(
  //           'https://bah--application-default-rtdb.asia-southeast1.firebasedatabase.app/normal/-NLMu2GkBcFSHXqnPJQM/data/0')
  //       .onValue
  //       .listen((event) {
  //     // Value contains our data.
  //     final Object? testData = event.snapshot.value;
  //     setState(() {
  //       _displayText = 'Normal Place : $testData';
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    print(ref);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),

      // Start : Contents Placeholder

      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(children: [
          Text(
              'https://bah--application-default-rtdb.asia-southeast1.firebasedatabase.app/normal/-NLMu2GkBcFSHXqnPJQM/data/0')
        ]),
      )),

      // End : Contents Placeholder

      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}
