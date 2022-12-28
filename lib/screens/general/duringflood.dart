import 'package:flutter/material.dart';
import 'package:flutterui/screens/bottom_menu.dart';
import 'package:flutterui/screens/home_button.dart';

class DuringFloodTips extends StatelessWidget {
  const DuringFloodTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips During Flood'),
      ),

      // Contents Placeholder

      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}
