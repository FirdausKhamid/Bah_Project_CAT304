// import 'dart:html';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/screens/bottom_menu.dart';
import 'package:flutterui/screens/home_button.dart';

// class Alert extends StatelessWidget {
//   const Alert({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Location'),
//       ),

//       // Call the method to retrieve and display data from the database
//       //body: _displayData(),

//       bottomNavigationBar: const MyBottomMenuNavigationBar(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: const MyHomeButton(),
//     );
//   }
// }

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),

      // Use a StreamBuilder to listen to changes in the data
      body: StreamBuilder<Map<String, List<String>>>(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                String? key = snapshot.data?.keys.elementAt(index);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        key!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...snapshot.data![key]!
                        .map((value) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ))
                        .toList(),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),

      bottomNavigationBar: const MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MyHomeButton(),
    );
  }

  Stream<Map<String, List<String>>> getData() {
    final databaseReference = FirebaseDatabase.instance.ref();
    return databaseReference.onValue.map((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>;
        Map<String, List<String>> results = {};
        values.forEach((key, value) {
          results[key] = value;
        });
        return results;
      } else {
        return <String, List<String>>{};
      }
    });
  }
}
