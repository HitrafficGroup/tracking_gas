import 'package:flutter/material.dart';
class customDrawer extends StatelessWidget {
  const customDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Home Cli'),
            selected: "/client_home" ==  ModalRoute.of(context)!.settings.name!,
            onTap: () {
              Navigator.pushReplacementNamed(context, "/client_home");
            },
          ),
          ListTile(
            title: const Text('Home Delivery'),
            selected: "/delivery_home" ==  ModalRoute.of(context)!.settings.name!,
            onTap: () {
              Navigator.pushReplacementNamed(context, "/delivery_home");
            },
          ),
          ListTile(
            title: const Text('Tracking delivery'),
            selected: "/delivery_tracking" ==  ModalRoute.of(context)!.settings.name!,
            onTap: () {
              Navigator.pushReplacementNamed(context, "/delivery_tracking");
            },
          ),
          ListTile(
            title: const Text('Solicitud Cliente'),
            selected: "/client_solicitud" ==  ModalRoute.of(context)!.settings.name!,
            onTap: () {
              Navigator.pushReplacementNamed(context, "/client_solicitud");
            },
          ),
        ],
      ),
    );

  }

}
