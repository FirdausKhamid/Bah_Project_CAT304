import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/screens/widgets/bottom_menu.dart';
import 'package:flutterui/screens/widgets/home_button.dart';
import 'package:flutterui/screens/widgets/search_bar.dart';
import 'package:flutterui/screens/widgets/list_tiles.dart';
import 'package:flutterui/screens/widgets/location_card.dart';

class NormalList extends StatefulWidget {
  const NormalList({super.key});

  @override
  State<NormalList> createState() => NormalListState();
}

class NormalListState extends State<NormalList> {
  //==================   Referencing Database =============================
  final ref = FirebaseDatabase.instance.ref();
  Future<void> fetch_fb() async {
    var snapshot = await ref.child('normal').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print("NOOOOOOO O OO ");
    }
  }

  @override
  void initState() {
    super.initState();
    fetch_fb();
  }

  Widget build(BuildContext context) {
    print(ref);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: CardFb2(
              text: "Sabah",
              imageUrl: "assets/location.png",
              onPressed: () {},
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: CardFb2(
              text: "Sarawak",
              imageUrl: "assets/location.png",
              onPressed: () {},
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: CardFb2(
              text: "[Example Placeholder]",
              imageUrl: "assets/location.png",
              onPressed: () {},
            )),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}
