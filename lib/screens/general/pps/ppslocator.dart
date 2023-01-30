import 'package:flutter/material.dart';
// import 'package:flutterui/screens/widgets/bottom_menu.dart';
// import 'package:flutterui/screens/widgets/home_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class PPSLocator extends StatefulWidget {
  PPSLocator({super.key});

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(1.3521, 103.8198),
    zoom: 11.0,
  );

  Set<Marker> userLocationMarker = {};

  @override
  State<PPSLocator> createState() => _PPSLocatorState();
}

class _PPSLocatorState extends State<PPSLocator> {
  late GoogleMapController mapController;

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PPS Locator'),
      ),

      // Contents Placeholder
      body: GoogleMap(
        initialCameraPosition: PPSLocator.initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Position position = await _determinePosition();

            mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 11.0)));

            markers.clear();

            markers.add(Marker(
              markerId: const MarkerId("userLocation"),
              position: LatLng(position.latitude, position.longitude),
            ));

            setState(() {});
          },
          label: const Text("Current Location"),
          icon: const Icon(Icons.location_history)),

      // bottomNavigationBar: MyBottomMenuNavigationBar(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: MyHomeButton(),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
