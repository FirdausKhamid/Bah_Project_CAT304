import 'package:flutter/material.dart';
import 'package:flutterui/screens/widgets/bottom_menu.dart';
import 'package:flutterui/screens/widgets/home_button.dart';
import 'package:flutterui/screens/widgets/button.dart';

class Danger extends StatefulWidget {
  @override
  State<Danger> createState() => _DangerState();
}

class _DangerState extends State<Danger> {
  // const Danger({super.key});
  // final cariAyatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),

      // Contents Placeholder
      body: Center(
        child: InvertedButtonFb2(text: "Next", onPressed: () {}),
      ),

      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}
