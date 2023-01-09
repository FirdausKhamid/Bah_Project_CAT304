import 'package:flutter/material.dart';
import 'package:flutterui/screens/bottom_menu.dart';
import 'package:flutterui/screens/home_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PPSLocator extends StatefulWidget {
  const PPSLocator({super.key});

  @override
  _PPSLocatorState createState() => _PPSLocatorState();
}

class _PPSLocatorState extends State<PPSLocator> {
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = {};
  int _markerIdCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PPS Locator'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 2,
        ),
        markers: Set<Marker>.of(markers.values),
        onTap: _addMarker,
      ),
      bottomNavigationBar: const MyBottomMenuNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MyHomeButton(),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(LatLng latLng) {
    final MarkerId markerId = MarkerId(_markerIdCounter.toString());
    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: const InfoWindow(
        title: 'Place',
        snippet: 'Tap to view details',
      ),
      onTap: () => _showPlaceDetails(markerId),
    );
    setState(() {
      markers[markerId] = marker;
      _markerIdCounter++;
    });
  }

  void _showPlaceDetails(MarkerId markerId) {
    final Marker? marker = markers[markerId];
    // Show the place details in a modal bottom sheet or something similar
  }
}
