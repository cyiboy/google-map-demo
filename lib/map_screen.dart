import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'app/core/p.dart';
import 'componect/custom_appbar.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: P.request.locationController.text,),
      body:Container(
          child: P.request.initialPosition == null
              ? Container(
            alignment: Alignment.center,
            child: Center(child: CircularProgressIndicator()),
          )
              : Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: P.request.initialPosition!, zoom: 15),
                onMapCreated: P.request.onCreate,
                myLocationEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                markers: Set<Marker>.of(P.request.markers),
                onCameraMove: P.request.onCameraMove,
                polylines: P.request.polyLines,
              ),
            ],
          )) ,
    );


  }
}
