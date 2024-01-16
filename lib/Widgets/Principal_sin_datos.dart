import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Widgets/Tabla_Principal.dart';

import '../Datos/vehiculo_datos.dart';
import '../Screens/mainScreen.dart';

class Principal_sin_datos extends StatefulWidget {
  const Principal_sin_datos({super.key});

  @override
  State<Principal_sin_datos> createState() => _Principal_sin_datosState();
}

class _Principal_sin_datosState extends State<Principal_sin_datos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      child: Text(
        'No hay autos en reparacion...',
        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
