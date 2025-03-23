import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Allstatemap extends StatelessWidget {
  final double lat;
  final double lng;
  final String title;

  Allstatemap({required this.lat, required this.lng, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId('destination'),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: title),
          ),
        },
      ),
    );
  }
}
