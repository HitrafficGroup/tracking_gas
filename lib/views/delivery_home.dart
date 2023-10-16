import 'package:flutter/material.dart';
import 'package:gas_route/components/customDrawer.dart';
class deliveryHome extends StatefulWidget {
  const deliveryHome({super.key});

  @override
  State<deliveryHome> createState() => _deliveryHomeState();
}

class _deliveryHomeState extends State<deliveryHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME"),),
      drawer: customDrawer(),
      body: Center(
        child: Text("Home Delivery"),
      ),
    );
  }

}
