import 'package:flutter/material.dart';
import 'package:frontend/globals.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class MapService {
  late BuildContext context;
  final Logger _logger = Logger();
  Set<Marker> markers = {};
  ValueNotifier<bool> isLoading = ValueNotifier(true);

  MapService(this.context);

  GoogleMapController? _controller;
  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Position? currentPosition;

  initController(GoogleMapController controller) {
    _controller = controller;
    _getCurrentPosition();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showToast('Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showToast('Location permissions are denied');

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showToast(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    if (_controller == null) return;

    final hasPermission = await _handleLocationPermission();
    isLoading.value = false;
    print("No permission to get location");

    if (!hasPermission) return;

    print("Getting current location");
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentPosition = position;
    _logger.i("Got current user information", position);

    _controller!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        zoom: 15,
        target: LatLng(
          currentPosition!.latitude,
          currentPosition!.longitude,
        ),
      ),
    ));

    addMarker("CurrentLocation", LatLng(position.latitude, position.longitude));

    isLoading.value = false;
  }

  void addMarker(String id, LatLng location) {
    markers.add(Marker(markerId: MarkerId(id), position: location));
  }

  getCurrentLat() {
    if (currentPosition == null) {
      return kGooglePlex.target.latitude;
    }

    return currentPosition!.latitude;
  }

  getCurrentLong() {
    if (currentPosition == null) {
      return kGooglePlex.target.longitude;
    }

    return currentPosition!.longitude;
  }

  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
  }
}
