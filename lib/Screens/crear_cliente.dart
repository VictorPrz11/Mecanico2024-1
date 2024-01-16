import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Datos/vehiculo_datos.dart';
import 'package:Mecanico/Screens/mainScreen.dart';
import 'package:Mecanico/Widgets/Tabla_Principal.dart';
import 'package:hive/hive.dart';

import '../Datos/cliente_datos.dart';
import 'cliente_buscar.dart';
import 'crear_vehiculo.dart';

class crear_cliente extends StatefulWidget {
  const crear_cliente({super.key});

  @override
  State<crear_cliente> createState() => _crear_clienteState();
}

class _crear_clienteState extends State<crear_cliente> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController domicilio = TextEditingController();
  final TextEditingController ciudad = TextEditingController();
  final TextEditingController telefono = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 40.0)),
          ),
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Registro Cliente',
            style: GoogleFonts.oswald(
              fontSize: 30,
              //fontWeight: FontWeight.w600,
            ),
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            if (nombre.text.isEmpty ||
                domicilio.text.isEmpty ||
                ciudad.text.isEmpty ||
                telefono.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  dismissDirection: DismissDirection.horizontal,
                  behavior: SnackBarBehavior.fixed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // side: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  backgroundColor: Colors.blueGrey,
                  content: Text(
                    'Todos los campos son necesarios para registrar un cliente',
                    style: GoogleFonts.oswald(
                      color: HexColor('#FFFFFF'),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  )));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return crear_vehiculo(
                        nombre: nombre.text,
                        ciudad: ciudad.text,
                        domicilio: domicilio.text,
                        telefono: telefono.text);
                  },
                ),
              );
              setState(() {});
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              fixedSize: Size(150, 50),
              backgroundColor: HexColor('dee1ec')),
          child: Text(
            'Siguiente',
            style: GoogleFonts.oswald(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                  //alignment: Alignment.topCenter,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: HexColor('dee1ec'),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' Datos cliente',
                        style: GoogleFonts.oswald(
                            color: Colors.black, fontSize: 25),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              camposdetexto('Ingresa el nombre del cliente', nombre, 25,
                  TextInputType.name, Icons.person),
              camposdetexto('Ingresa el domicilio', domicilio, 25,
                  TextInputType.multiline, Icons.location_on),
              camposdetexto('Ingresa la ciudad', ciudad, 25,
                  TextInputType.multiline, Icons.location_city),
              camposdetexto('Ingresa el telefono', telefono, 25,
                  TextInputType.phone, Icons.phone),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ]));
  }

  Widget camposdetexto(String texto, TextEditingController controlador,
      double espaciado, keys, icono) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 200,
                child: TextField(
                  style: GoogleFonts.oswald(fontSize: 20, color: Colors.black),
                  keyboardType: keys,
                  decoration: InputDecoration(
                      icon: Icon(
                        icono,
                        // fill: 30,
                        size: 40,
                      ),
                      iconColor: HexColor('dee1ec'),
                      hintText: texto,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: HexColor('dee1ec'),
                      filled: true),
                  controller: controlador,
                ),
              ),
            )
          ],
        ));
  }
}
