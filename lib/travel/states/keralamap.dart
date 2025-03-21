import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
void main(){
  runApp(MaterialApp(home: GoogleMapScreen(),));
}
class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;

  final LatLng _initialPosition = LatLng(9.9312, 76.2673); // Kochi, Kerala

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Maps in Flutter")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId("initial"),
            position: _initialPosition,
            infoWindow: InfoWindow(title: "My Location"),
          ),
        },
      ),
    );
  }
}
