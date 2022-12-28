import 'package:flutter/material.dart';
import 'package:flutterui/screens/bottom_menu.dart';
import 'package:flutterui/screens/home_button.dart';

class PostFloodTips extends StatelessWidget {
  const PostFloodTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips Post Flood'),
      ),

      // Contents Placeholder

      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}
