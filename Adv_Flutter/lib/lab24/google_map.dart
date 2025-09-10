import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AnimatedMarkerMap extends StatefulWidget {
  @override
  _AnimatedMarkerMapState createState() => _AnimatedMarkerMapState();
}

class _AnimatedMarkerMapState extends State<AnimatedMarkerMap> {
  late GoogleMapController _mapController;
  Marker? _marker;
  int _currentIndex = 0;

  final List<LatLng> _locations = [
    LatLng(37.7749, -122.4194), // San Francisco
    LatLng(34.0522, -118.2437), // Los Angeles
    LatLng(36.1699, -115.1398)  // Las Vegas
  ];

  @override
  void initState() {
    super.initState();
    _startMarkerAnimation();
  }

  void _startMarkerAnimation() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _locations.length;
        _marker = Marker(
          markerId: MarkerId('animated_marker'),
          position: _locations[_currentIndex],
          infoWindow: InfoWindow(title: "Animated Marker"),
        );
      });

      // Smoothly move the camera
      _mapController.animateCamera(
        CameraUpdate.newLatLng(_locations[_currentIndex]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Marker on Google Map")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _locations[0],
          zoom: 5,
        ),
        markers: _marker != null ? {_marker!} : {},
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
