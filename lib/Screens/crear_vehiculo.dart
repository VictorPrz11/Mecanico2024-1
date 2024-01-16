import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Datos/vehiculo_datos.dart';
import 'package:Mecanico/Screens/llenadonuevo.dart';
import 'package:Mecanico/Screens/mainScreen.dart';
import 'package:Mecanico/Widgets/Agenda.dart';
import 'package:Mecanico/Widgets/Tabla_Principal.dart';
import 'package:hive/hive.dart';

import '../Datos/cliente_datos.dart';
import '../Datos/imagenes.dart';
import '../Widgets/ImagenPicker.dart';
import 'cliente_buscar.dart';

class crear_vehiculo extends StatefulWidget {
  String nombre;
  String domicilio;
  String ciudad;
  String telefono;
  crear_vehiculo(
      {super.key,
      required this.nombre,
      required this.ciudad,
      required this.domicilio,
      required this.telefono});

  @override
  _crear_vehiculoState createState() => _crear_vehiculoState();
}

class _crear_vehiculoState extends State<crear_vehiculo> {
  final TextEditingController marca = TextEditingController();
  final TextEditingController modelo = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController motor = TextEditingController();
  final TextEditingController color = TextEditingController();
  final TextEditingController vin = TextEditingController();
  final TextEditingController kms = TextEditingController();
  final TextEditingController placas = TextEditingController();
  final TextEditingController servicio = TextEditingController();

  late Vehiculo vehiculo;

  @override
  Widget build(BuildContext context) {
    var imagen;
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Registro Vehiculo',
            style: GoogleFonts.oswald(
              fontSize: 30,
              // fontWeight: FontWeight.w600,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 40.0)),
          ),
        ),
        body: ListView(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            //padding: EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(5),
                  //alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: HexColor('#dee1ec'),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Datos Vehiculo',
                        style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 30,
                          //fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade900),
                        child: IconButton(
                          icon: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                camposdetexto('Marca', marca, 25, TextInputType.multiline),
                camposdetexto('Modelo', modelo, 25, TextInputType.multiline),
                camposdetexto('Año', year, 25, TextInputType.number),
                camposdetexto('Motor', motor, 25, TextInputType.multiline),
                camposdetexto('Color', color, 25, TextInputType.multiline),
                camposdetexto('Vin', vin, 25, TextInputType.number),
                camposdetexto('Kms', kms, 25, TextInputType.number),
                camposdetexto('Placas', placas, 25, TextInputType.multiline),
                camposdetexto(
                    'Servicio', servicio, 25, TextInputType.multiline),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return mainScreen();
                                },
                              ),
                            );
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fixedSize: Size(150, 50),
                            backgroundColor: HexColor('dee1ec'),
                          ),
                          child: Text(
                            'Cancelar',
                            style: GoogleFonts.oswald(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (marca.text.isEmpty ||
                                modelo.text.isEmpty ||
                                year.text.isEmpty ||
                                motor.text.isEmpty ||
                                color.text.isEmpty ||
                                vin.text.isEmpty ||
                                kms.text.isEmpty ||
                                placas.text.isEmpty ||
                                servicio.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  dismissDirection: DismissDirection.horizontal,
                                  shape: Border.all(width: 10),
                                  backgroundColor: Colors.black,
                                  content: Text(
                                      'Todos los campos son necesarios para registrar un vehiculo')));
                            } else {
                              Vehiculo vehiculo = Vehiculo(
                                marca: marca.text,
                                modelo: modelo.text,
                                year: year.text,
                                motor: motor.text,
                                color: color.text,
                                vin: vin.text,
                                kms: kms.text,
                                placas: placas.text,
                                servicio: servicio.text,
                              );

                              Clientes _clientes = Clientes(
                                  nombre: widget.nombre,
                                  domicilio: widget.domicilio,
                                  ciudad: widget.ciudad,
                                  telefono: widget.telefono,
                                  vehiculos: vehiculo,
                                  recibido:
                                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                  imagenes: imagen);

                              var boxCliente = Hive.box('clientes');

                              boxCliente.add(_clientes);

                              print(boxCliente.values);
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            fixedSize: Size(150, 50),
                            backgroundColor: HexColor('dee1ec'),
                          ),
                          child: Text(
                            'Guardar',
                            style: GoogleFonts.oswald(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ]));
  }

  Widget camposdetexto(
      String texto, TextEditingController controlador, double espaciado, keys) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                texto,
                style: GoogleFonts.oswald(
                    fontSize: 26,
                    //fontWeight: FontWeight.w600,
                    color: HexColor('dee1ec')),
              ),
            ),
            Container(
              width: 220,
              child: TextField(
                style: GoogleFonts.oswald(fontSize: 20, color: Colors.black),
                keyboardType: keys,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: HexColor('dee1ec'),
                    filled: true),
                controller: controlador,
              ),
            ),
          ],
        ));
  }
}
