import 'package:flutter/material.dart';
import 'package:frontend/src/maps/services/maps_service.dart';
import 'package:frontend/widgets/loading_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late MapService _mapService;

  @override
  void initState() {
    _mapService = MapService(context);
    super.initState();
  }

  @override
  void dispose() {
    _mapService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your shop location"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Continue"),
        onPressed: () {
          Navigator.pop(context, {
            "lat": _mapService.getCurrentLat(),
            "long": _mapService.getCurrentLong(),
          });
        },
      ),
      body: LoadingWidget(
        isLoading: _mapService.isLoading,
        child: GoogleMap(
          markers: _mapService.markers,
          onTap: (argument) {
            _mapService.addMarker(DateTime.now().toIso8601String(), argument);
            setState(() {});
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          // mapType: MapType.hybrid,
          initialCameraPosition: _mapService.kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _mapService.initController(controller);
          },
        ),
      ),
    );
  }
}
