import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const LatLng _cairoPosition = LatLng(30.0444, 31.2357);

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: _cairoPosition,
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Map')),
      // Full-screen map with a red marker placed on Cairo.
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: {
          Marker(
            markerId: const MarkerId('cairo_marker'),
            position: _cairoPosition,
            infoWindow: const InfoWindow(title: 'Cairo'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        },
      ),
    );
  }
}
