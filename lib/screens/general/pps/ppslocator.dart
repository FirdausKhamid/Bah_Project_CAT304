import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/screens/general/pps/ppsList.dart';
import 'package:flutterui/screens/widgets/bottom_menu.dart';
import 'package:flutterui/screens/widgets/home_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutterui/screens/widgets/ppsListButton.dart';

final FirebaseDatabase _database = FirebaseDatabase.instance;

class PPSLocator extends StatefulWidget {
  // const PPSLocator({required Key key}) : super(key: key);

  @override
  _PPSLocatorState createState() => _PPSLocatorState();
}

class _PPSLocatorState extends State<PPSLocator> {
  late GoogleMapController _mapController;
  bool _locationServiceEnabled = false;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationService();
  }

  void _checkLocationService() async {
    bool serviceEnabled = await Location().serviceEnabled();
    if (serviceEnabled) {
      _getLocation();
      setState(() {
        _locationServiceEnabled = true;
      });
    } else {
      setState(() {
        _locationServiceEnabled = false;
      });
      _askToEnableLocationService();
    }
  }

  void _askToEnableLocationService() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Location Services Disabled"),
          content: const Text(
              "To use this app, please enable location services in your device's settings."),
          actions: <Widget>[
            TextButton(
              child: Text("Open Settings"),
              onPressed: () async {
                await openAppSettings();
                _checkLocationService();
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _getLocation() async {
    LocationData locationData = await Location().getLocation();
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 17.0,
        ),
      ),
    );
    setState(() {
      _locationData = locationData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PPS Locator'), actions: [
        IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PPSList()),
            );
          },
        )
      ]),
      body: _locationServiceEnabled
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(_locationData?.latitude ?? 0,
                      _locationData?.longitude ?? 0),
                  zoom: 17.0,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Location Services Disabled",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Text("Enable Location Services"),
                    onPressed: _askToEnableLocationService,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyHomeButton(),
    );
  }
}

void updateLocation(LocationData locationData) {
  _database.reference().child('locations').push().set({
    'latitude': locationData.latitude,
    'longitude': locationData.longitude,
  });
}
