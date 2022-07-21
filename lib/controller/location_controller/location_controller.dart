import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:menskart/view/address_page/add_address/widgets/location_fetch.dart';

class LocationController extends GetxController {
  final geolocator =
      Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  Position? currentPosition;
  LatLng? currentAddress;
  String pincode = '';
  String locatlityName = '';
  // String locatlity = '';
  String street = '';
  String country = '';
  String state = '';
  // String currentAddress = '';

  getCurrentLocation() async {
    Position position = await goToLocation();
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 14.0)));
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('Current Location'),
        position: LatLng(position.latitude, position.longitude)));
    update();
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      // currentPosition = position;
      getAddressfromLatLang(position.latitude, position.longitude);
      update();
    }).catchError((e) {
      log(e);
    });
  }

  void getAddressfromLatLang(latitude, longitude) async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = p[0];
      locatlityName = "${place.name}";
      // locatlity = "${place.locality}";
      street = "${place.street}";
      state = "${place.administrativeArea}";
      pincode = "${place.postalCode}";
      country = "${place.country}";
      update();
      log(p[0].toString());
    } catch (e) {
      print(e);
    }
  }

  onTapMarker(LatLng latLng) {
    Marker newMarker = Marker(
      markerId: const MarkerId('new_marker'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(latLng.latitude, latLng.longitude),
    );
    markers.clear();
    markers.add(newMarker);
    getAddressfromLatLang(latLng.latitude, latLng.longitude);
    print(markers.length);
    update();
  }

  Future<Position> goToLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location service is not enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission not granted');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
