import 'package:flutter/material.dart';
import 'package:gas_route/components/customDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class solicitudClient extends StatefulWidget {

  const solicitudClient({super.key});

  @override
  State<solicitudClient> createState() => _solicitudClientState();
}

class _solicitudClientState extends State<solicitudClient> {
  TextEditingController password = TextEditingController();
  TextEditingController cantidad = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("generar solicitud"),),
      drawer: customDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Seleccione las caracteristicas de su producto"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: password,
                decoration: InputDecoration(
                    icon: Icon(Icons.propane_tank_outlined),
                    labelText: "Tipo de Producto",
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: cantidad,
                decoration: InputDecoration(
                  icon: Icon(Icons.numbers), //icon at head of input
                  labelText: "Cantidad de Producto",
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(onPressed: enviarDatos, child: Text("Enviar")),
          )
        ],
      )
        
    );
  }
  Future<void> enviarDatos()async{
    print("enviamos el dato");
    FirebaseFirestore db = FirebaseFirestore.instance;
    final city = <String, String>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA"
    };

    await db.collection("users").add(city);
  }
}
