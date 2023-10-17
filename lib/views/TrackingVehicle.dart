import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gas_route/components/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const mapbox_token = "pk.eyJ1Ijoicm9ja2xpb24iLCJhIjoiY2xudDA2ajRjMWpwZTJvcW1jZDRhZDdneSJ9.sNux_YNVyQBXbG0SqPRhcQ";


class TrackingVehicle extends StatefulWidget {
  const TrackingVehicle({super.key});

  @override
  State<TrackingVehicle> createState() => _TrackingVehicleState();
}


class _TrackingVehicleState extends State<TrackingVehicle> {
  var my_position = LatLng(-2.8771849258680904, -78.96579481437648);
  String msagepos = "0 , 0";

  late Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(msagepos),
        ),
        drawer: customDrawer(),
        body: FlutterMap(
          children: [],
          options: MapOptions(center: my_position, minZoom: 5, maxZoom: 25, zoom: 18),
          nonRotatedChildren: [
            TileLayer(
              urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
              additionalOptions: const {
                'accessToken': mapbox_token,
                'id': 'mapbox/streets-v12'
              },
            ),
            MarkerLayer(markers: [
              Marker(point: my_position,child: Container(
                child: const Icon(
                  Icons.directions_car,
                  color: Colors.blueAccent,
                  size: 40,
                ),
              ))
            ])
          ],

        )
    );
  }

  void _getCurrentLocation() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final washingtonRef = db.collection("repartidores").doc("66fbb42a-817c-4927-a699-4b630dcd0a19");

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    LocationPermission permision;
    permision = await Geolocator.checkPermission();
    if(permision == LocationPermission.denied){
      permision = await Geolocator.requestPermission();
      if(permision == LocationPermission.denied){
        return Future.error("error");

      }
    }
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
            (Position? position) {

          washingtonRef.update({
            "latitud":position == null ? 'Unknown' :position.latitude.toString(),
            "longitud":position == null ? 'Unknown' :position.longitude.toString(),
          }).then(
                  (value) => print("DocumentSnapshot successfully updated!"),
              onError: (e) => print("Error updating document $e"));
          setState(() {
            msagepos =position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}';
            my_position = LatLng(position!.latitude,position.longitude);
          });
        });
  }



  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
}
