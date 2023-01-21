import 'package:flutter/material.dart';

class MyBottomMenuNavigationBar extends StatefulWidget {
  const MyBottomMenuNavigationBar({super.key});

  @override
  State<MyBottomMenuNavigationBar> createState() =>
      _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomMenuNavigationBar> {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info',
          backgroundColor: Colors.black,
        )
      ],
    );
  }
}
