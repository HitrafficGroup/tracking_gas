import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:gas_route/components/customDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
class solicitudClient extends StatefulWidget {

  const solicitudClient({super.key});

  @override
  State<solicitudClient> createState() => _solicitudClientState();
}

class _solicitudClientState extends State<solicitudClient> {
  TextEditingController cantidad = TextEditingController();
  String? dropdownValue;

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
            child: DropdownButton<String>(
              value: dropdownValue,
              hint: Text('Escoga el Producto'),
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Oxigeno', 'Propano', 'Argon','Nitrogeno']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
            child: ElevatedButton(onPressed: enviarDatos, child: Text("Generar Solicitud")),
          ),
        ],
      )

    );
  }
  Future<void> enviarDatos()async{

    FirebaseFirestore db = FirebaseFirestore.instance;
    var v4 = Uuid().v4();
    print(v4);
    final client_data = <String, dynamic>{
      "producto":  dropdownValue ?? "Propano",
      "cantidad":  cantidad.text,
      "id":v4,
      "latitud":"-2.876509024994795",
      "longitud":"-78.96678575021491",
    };
    await db.collection("pedidos").doc(v4).set(client_data);
  }
}
