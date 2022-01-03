import 'dart:typed_data';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/request/google_map_request.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'dart:ui' as ui;

import 'app/core/utils/constants.dart';

enum Modal {
  BOTTOM_MODAL,
  DESTINATION_MODAL,
  SET_STOP_MODAL,
  SET_PICKUP_MODAL,
  SELECT_CAR_TYPE_MODAL
}

class RequestController extends GetxController {

  RxBool loading = false.obs;
  late GoogleMapController mapController;
   LatLng? initialPosition;
  TextEditingController locationController = TextEditingController();


  LatLng? lastPosition;
  final Set<Marker> markers = {};
  final Set<Polyline> polyLines = {};
  Rxn<Modal> modal = Rxn(Modal.BOTTOM_MODAL);

  RxString selectCar = ''.obs;
  LatLng? pickupCoordinates;


  late BitmapDescriptor pickupPin;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  RxDouble ridePrice = 0.0.obs;
  RxString rideDistance = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    _setCustomMapPin();
  }

  @override
  void onClose() {
    super.onClose();
  }




  void onCreate(GoogleMapController controller) {
    mapController = controller;

  }

  void onCameraMove(CameraPosition position) {
    lastPosition = position.target;
  }


  addMarker(LatLng position, address) {

      markers.add(Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          anchor: Offset(0, 0.85),
          zIndex: 3,
          visible: true,
          infoWindow: InfoWindow(
              title: address, snippet: "pickup", ),
    icon: pickupPin
          ));




  }


  changeModal(Modal modals) {
    print(modals.toString());
    modal.value = modals;
    print(modal.value.toString());
  }

  setPickCoordinates(p) async {
    locationController.text = p['description'];
   PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p['place_id']);
    double lat = detail.result.geometry!.location.lat;
    double lng = detail.result.geometry!.location.lng;
    LatLng coordinates = LatLng(lat, lng);
    pickupCoordinates = coordinates;
    initialPosition = coordinates;
    print(pickupCoordinates);
    addMarker(initialPosition!, 'address');
  }

  _setCustomMapPin() async {
    getBytesFromAsset('assets/icon/location.png', 160).then((onValue) {
      pickupPin =BitmapDescriptor.fromBytes(onValue);

    }) ;

  }





  void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    mapController.animateCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    print(l1.toString());
    print(l2.toString());
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      check(u, c);
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }


}
