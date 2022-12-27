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
          label: 'Home',
          backgroundColor: Colors.black,
        )
      ],
    );
    // floatingActionButtonLocation:
    //     FloatingActionButtonLocation.miniCenterDocked,
    // floatingActionButton: SizedBox(
    //   height: 80,
    //   width: 80,
    //   child: FloatingActionButton(
    //     heroTag: "btn2",
    //     onPressed: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => const MyHomePage(
    //                   title: 'Test',
    //                 )),
    //       );
    //       debugPrint('Pressed Home');
    //     },
    //     backgroundColor: Colors.white,
    //     child: Image.asset(
    //       'assets/homebutton.png',
    //       width: 400,
    //     ),
    //   ),
    // )
    //;
  }
}
