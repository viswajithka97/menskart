import 'dart:async';
import 'package:flutter/material.dart';
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
                      final placemark = controller.p;
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Location'),
                          content: SizedBox(
                            height: 250,
                            width: 350,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: placemark!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(placemark[index].name!),
                                    subtitle: Text(placemark[index].locality!),
                                    onTap: () {
                                      controller.index = index;

                                      controller.getAddressfromLatLang();

                                      controller.update();
                                      Get.back();
                                      Get.back();
                                    },
                                  );
                                }),
                          ),
                          // actions: [
                          //   FlatButton(
                          //     onPressed: () {
                          //       Get.back();
                          //     },
                          //     child: const Text('OK'),
                          //   )
                          // ],
                        ),
                      );

                      // controller.update();
                      // Get.back();
                    },
                    icon: const Icon(Icons.save))
              ],
            ),
            body: GoogleMap(
              initialCameraPosition: initialPosition,
              mapType: MapType.normal,
              mapToolbarEnabled: true,
              markers: markers,
              onTap: (latLng) {
                controller.onTapMarker(latLng);
                controller.update();
              },
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                controller.getCurrentLocation();
              },
              label: const Text('Current Location'),
              icon: const Icon(Icons.location_on_outlined),
            ),
          );
        });
  }
}
