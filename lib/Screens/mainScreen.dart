import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:Mecanico/Datos/meeting.dart';
import 'package:Mecanico/Widgets/Principal_sin_datos.dart';
import 'package:Mecanico/Widgets/Tabla_Principal.dart';

import 'Crear_Cita.dart';
import 'cliente_buscar.dart';
import 'crear_cliente.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController domicilio = TextEditingController();
  final TextEditingController ciudad = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Hive.openBox('vehiculo');
    Hive.openBox<Cita>('citas');
    Hive.openBox('clientes');
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Servicio Automotriz',
          style: GoogleFonts.oswald(fontSize: 30),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 40.0)),
        ),
      ),
      endDrawer: Expanded(
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: (MediaQuery.of(context).size.width * 0.75)),
          // backgroundColor: Colors.transparent,
          width: 200,
          child: Column(
            //padding: EdgeInsets.fromLTRB(0, 100, 0, 0),

            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  color: Colors.blueGrey,
                ),
                alignment: Alignment.center,
                height: 80,
                child: Text('Menu de opciones',
                    style:
                        GoogleFonts.oswald(color: Colors.white, fontSize: 30)),
              ),
              Container(
                  height: 585,
                  decoration: BoxDecoration(color: Colors.grey.shade900),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        title: Text(
                          'Registrar Cliente',
                          style: GoogleFonts.oswald(
                              color: Colors.white, fontSize: 20),
                        ),
                        selected: _selectedIndex == 0,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return crear_cliente();
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        title: Text('Nuevo Cita',
                            style: GoogleFonts.oswald(
                                color: Colors.white, fontSize: 20)),
                        selected: _selectedIndex == 1,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Crear_cita();
                            },
                          )).then((value) {
                            setState(() {});
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.file_copy_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        title: Text('Generar reporte',
                            style: GoogleFonts.oswald(
                                color: Colors.white, fontSize: 20)),
                        selected: _selectedIndex == 2,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return cliente_buscar();
                            },
                          ));
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          tabla_principal()
        ],
      ),
    );
  }

  Widget textos(
      TextEditingController controlador, double espaciado, String texto) {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          texto,
          style:
              GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: espaciado,
        ),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: HexColor('#C8D0D8'),
                filled: true),
            controller: controlador,
          ),
        ),
      ],
    ));
  }
}
