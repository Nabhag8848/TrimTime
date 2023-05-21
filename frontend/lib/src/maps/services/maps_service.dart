import 'package:flutter/material.dart';
import 'package:frontend/globals.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class MapService {
  late BuildContext context;
  final Logger _logger = Logger();

  ValueNotifier<Set<Marker>> markers = ValueNotifier({});
  ValueNotifier<bool> isLoading = ValueNotifier(true);
  
  GoogleMapController? _controller;
  CameraPosition initialLocation = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 15,
  );

  LatLng? _selectedLocation;
  MapService(this.context);

  MapService.initial(this.context, this.initialLocation);

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

    _selectedLocation = LatLng(position.latitude, position.longitude);
    _logger.i("Got current user information", position);

    moveCameraToPosition(_selectedLocation!);

    addMarker("CurrentLocation", _selectedLocation!);

    isLoading.value = false;
  }

  void addMarker(String id, LatLng location) {
    _selectedLocation = location;
    markers.value = {(Marker(markerId: MarkerId(id), position: location))};
  }

  void moveCameraToPosition(LatLng pos) {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        zoom: 15,
        target: LatLng(pos.latitude, pos.longitude),
      ),
    ));
  }

  getCurrentLat() {
    if (_selectedLocation == null) {
      return initialLocation.target.latitude;
    }

    return _selectedLocation!.latitude;
  }

  getCurrentLong() {
    if (_selectedLocation == null) {
      return initialLocation.target.longitude;
    }

    return _selectedLocation!.longitude;
  }

  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
  }
}
