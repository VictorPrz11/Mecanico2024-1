import 'package:Mecanico/Datos/imagenes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Datos/cliente_datos.dart';
import 'package:Mecanico/Datos/meeting.dart';
import 'package:Mecanico/Datos/vehiculo_datos.dart';
import 'package:Mecanico/Screens/mainScreen.dart';
import 'package:Mecanico/Widgets/Agenda.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:Mecanico/Datos/meeting.dart';
import 'package:Mecanico/Widgets/Principal_sin_datos.dart';
import 'package:Mecanico/Widgets/Tabla_Principal.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(VehiculoAdapter());
  Hive.registerAdapter(CitaAdapter());
  Hive.registerAdapter(ClientesAdapter());
  Hive.registerAdapter(ImageAdapter());
  await Hive.openBox('vehiculo');
  await Hive.openBox<Cita>('citas');
  await Hive.openBox('clientes');
  await Hive.openBox('imagenBox');

  //SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainScreen(),
    );
  }
}
