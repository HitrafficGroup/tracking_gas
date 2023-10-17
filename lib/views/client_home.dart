import 'package:flutter/material.dart';
import 'package:gas_route/components/customDrawer.dart';
class clientHome extends StatefulWidget {
  const clientHome({super.key});

  @override
  State<clientHome> createState() => _clientHomeState();
}

class _clientHomeState extends State<clientHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME"),),
      drawer: customDrawer(),
      body: Center(
        child: Text("Home Client"),
      ),
    );
  }
}
