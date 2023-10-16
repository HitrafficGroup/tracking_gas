import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
const mapbox_token = "pk.eyJ1Ijoicm9ja2xpb24iLCJhIjoiY2xudDA2ajRjMWpwZTJvcW1jZDRhZDdneSJ9.sNux_YNVyQBXbG0SqPRhcQ";
final my_position = LatLng(-2.8771849258680904, -78.96579481437648);
class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("data"),
      ),
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
}
