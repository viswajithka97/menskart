import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:menskart/controller/location_controller/location_controller.dart';

final Completer<GoogleMapController> mapcontroller = Completer();

const CameraPosition initialPosition =
    CameraPosition(target: LatLng(9.9487, 76.3464), zoom: 14.0);

late GoogleMapController googleMapController;

Set<Marker> markers = {};

class LocationFetch extends StatelessWidget {
  const LocationFetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Location'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      controller.update();
                      Get.back();
                    },
                    icon: Icon(Icons.save))
              ],
            ),
            body: GoogleMap(
              initialCameraPosition: initialPosition,
              mapType: MapType.normal,
              mapToolbarEnabled: true,
              markers: markers,
              onTap: (LatLng) {
                controller.onTapMarker(LatLng);
                controller.update();
              },
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                controller.getCurrentLocation();
                log(controller.currentAddress.toString());
                // Get.back();
              },
              label: const Text('Go To Location'),
              icon: const Icon(Icons.location_on_outlined),
            ),
          );
        });
  }
}
