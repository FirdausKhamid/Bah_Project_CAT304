import 'package:firebase_database/firebase_database.dart';
import 'package:flutterui/screens/widgets/gradient_button.dart';
import 'package:flutterui/screens/widgets/labeled_check_box.dart';
import 'package:flutterui/screens/widgets/outline_button.dart';
import 'package:flutterui/screens/widgets/text_field.dart';
import 'package:flutter/material.dart';

class CreateReport extends StatefulWidget {
  const CreateReport({super.key});

  @override
  State<CreateReport> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  // Referencing Database
  final referenceDatabase = FirebaseDatabase.instance;

  // Input Contoller Variables
  final reportTitleController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Referencing Database Directory To Be Appended

    final ref = referenceDatabase.ref('Report');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Report'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text Fields
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyInputTextField(
                    inputController: reportTitleController,
                    inputLabel: 'Report Title',
                    iconsImage: Icons.title,
                    inputHintText: '"roadblock due to flood..."',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyInputTextField(
                    inputController: locationController,
                    inputLabel: 'Location',
                    iconsImage: Icons.pin_drop,
                    inputHintText: 'Please Drop Your Location',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyInputTextField(
                    inputController: dateController,
                    inputLabel: 'Date',
                    iconsImage: Icons.date_range,
                    inputHintText: 'Please Drop Your Location',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyInputTextField(
                    inputController: descController,
                    inputLabel: 'Description of Report',
                    iconsImage: Icons.description,
                    inputHintText: 'Please Drop Your Location',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10, 150, 10),
                  child: OutlineButtonFb1(
                    text: 'Add Image',
                    onPressed: () {},
                    iconData: Icons.image,
                  ),
                ),

                // Post Button & Data Insertion Command
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButtonFb1(
                    text: 'Post',
                    onPressed: () {
                      Map<String, String> students = {
                        'description': descController.text,
                        'location': locationController.text,
                        'date': dateController.text,
                        'title': reportTitleController.text,
                      };
                      ref.push().set(students);
                      descController.clear();
                      locationController.clear();
                      dateController.clear();
                      reportTitleController.clear();
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
