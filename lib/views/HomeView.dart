import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hola"),
          ],
        ),
      ),
    );
  }
}
