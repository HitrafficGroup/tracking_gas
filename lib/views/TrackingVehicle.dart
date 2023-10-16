import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gas_route/components/customDrawer.dart';
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
  late Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
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
  Future<Position> determinePosition() async{
    LocationPermission permision;
    permision = await Geolocator.checkPermission();
    if(permision == LocationPermission.denied){
      permision = await Geolocator.requestPermission();
      if(permision == LocationPermission.denied){
        return Future.error("error");

      }
    }
    return await Geolocator.getCurrentPosition();
  }
  void getCurrentLocation()async{
    Position pos = await determinePosition();
    setState(() {
      my_position = LatLng(pos.latitude,pos.longitude);
    });
    print(pos.latitude);
    print(pos.longitude);
  }
  @override
  StreamSubscription<ServiceStatus> serviceStatusStream = Geolocator.getServiceStatusStream().listen(
          (ServiceStatus status) {
        print(status);
      });
  void initState() {
    // TODO: implement initState

    // timer = Timer.periodic(Duration(seconds: 3), (timer) {
    //   getCurrentLocation();
    // });

    super.initState();
  }
}
