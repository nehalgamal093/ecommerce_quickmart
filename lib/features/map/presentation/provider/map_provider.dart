import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapProvider extends ChangeNotifier {
  bool loading = true;
  String address = "No address selected";
  LatLng? currentPosition;
  LatLng? selectedPosition;
  Placemark? place;
  Marker? marker;
  late GoogleMapController mapController;
  Future<void> getCurrentLocation() async {
    final status = await Permission.location.request();
    if (status != PermissionStatus.granted) {
      loading = false;
      address = "Location permission denied";
      await openAppSettings();
      notifyListeners();
      return;
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition = LatLng(position.latitude, position.longitude);
      selectedPosition = currentPosition;
      loading = false;
      getAddressFromLatLng(currentPosition!);
      notifyListeners();
    } catch (e) {
      loading = false;
      address = 'Could not get location: $e';
    }
  }

  Future<void> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placeMarks.isNotEmpty) {
        place = placeMarks[0];
        address =
            '${place?.street}, ${place?.locality}, ${place?.administrativeArea}, ${place?.country},${place?.name}';
        notifyListeners();
      }
    } catch (e) {
      address = 'Could not get address: $e';
      notifyListeners();
    }
  }

  void changeMapController(GoogleMapController controller) {
    mapController = controller;
    notifyListeners();
  }

  void changePosition(LatLng position) {
    selectedPosition = position;
    notifyListeners();
  }

  void changeMarker(Marker marker) {
    this.marker = marker;
    notifyListeners();
  }
}
