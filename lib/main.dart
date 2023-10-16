import 'package:flutter/material.dart';
import 'package:gas_route/views/HomeView.dart';
import 'package:gas_route/views/MapView.dart';
import 'package:gas_route/views/TrackingVehicle.dart';
import 'package:gas_route/views/client_home.dart';
import 'package:gas_route/views/delivery_home.dart';
import 'package:gas_route/views/solicitud_client.dart';
import 'color_schemes.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/delivery_home',
      routes: {
        '/delivery_home':(context) => deliveryHome(),
        '/client_home':(context) => clientHome(),
        '/delivery_tracking':(context) => TrackingVehicle(),
        '/client_solicitud':(context) => solicitudClient(),
      },
    );
  }
}