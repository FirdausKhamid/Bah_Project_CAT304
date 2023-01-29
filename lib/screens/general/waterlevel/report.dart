import 'package:flutter/material.dart';
import 'package:flutterui/screens/general/waterlevel/create_report.dart';
import 'package:flutterui/screens/widgets/bottom_menu.dart';
import 'package:flutterui/screens/widgets/home_button.dart';
import 'package:flutterui/screens/widgets/report_card.dart';

class ReportList extends StatefulWidget {
  const ReportList({super.key});

  @override
  State<ReportList> createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Community Page",
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateReport()),
                );
              },
            )
          ]),

      // Contents Placeholder

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                child: ReportCard(
                    imgUrl:
                        'https://www.mcdonalds.com.my/microsites/nasilemak/images/hero_m.jpg',
                    title: 'Lapaaaaaaar',
                    color: Color.fromARGB(255, 94, 12, 8),
                    onTap: () {
                      print('Pressed Card');
                    }),
              ),
            ),
          )
        ],
      ),

      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}
