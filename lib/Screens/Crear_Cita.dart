import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Datos/meeting.dart';

import '../Widgets/Agenda.dart';

class Crear_cita extends StatefulWidget {
  Crear_cita({
    super.key,
  });

  @override
  State<Crear_cita> createState() => _Crear_citaState();
}

final TextEditingController nombre = TextEditingController();
final TextEditingController razon = TextEditingController();
final TextEditingController telefono = TextEditingController();
final TextEditingController fecha = TextEditingController();

class _Crear_citaState extends State<Crear_cita> {
  @override
  void initState() {
    nombre.text = '';
    razon.text = '';
    telefono.text = '';
    fecha.text = '';
  }

  @override
  DateTime date = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Agendar Cita',
            style: GoogleFonts.oswald(fontSize: 30),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 30.0)),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (nombre.text.isEmpty ||
                fecha.text.isEmpty ||
                razon.text.isEmpty ||
                telefono.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.fixed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  // side: BorderSide(color: Colors.grey, width: 0.5),
                ),
                content: Text(
                  'Es posible que no se haya llenado algun dato',
                  style: GoogleFonts.oswald(),
                ),
                backgroundColor: Colors.blueGrey.shade300,
              ));
            } else {
              final DateTime startTime = date;

              final cita = Hive.box<Cita>('citas');

              Cita datos = Cita(
                  startTime: startTime,
                  nombre: nombre.text,
                  razon: razon.text,
                  telefono: telefono.text,
                  funcion: true);
              cita.add(datos);

              nombre.text = '';
              fecha.text = '';
              razon.text = '';
              telefono.text = '';

              setState(() {});
              Navigator.pop(context);
            }
          },
          backgroundColor: HexColor('dee1ec'),
          label: Text(
            'Confirmar',
            style: GoogleFonts.oswald(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              camposdetexto('Nombre', nombre, 10, TextInputType.name),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: 200,
                          child: TextField(
                            readOnly: true,
                            style: GoogleFonts.oswald(
                                fontSize: 20, color: Colors.black),
                            //keyboardType: keys,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.calendar_month,
                                    color: HexColor('#243447'),
                                  ),
                                  onPressed: () async {
                                    DateTime? Newdate = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2060),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            dialogBackgroundColor:
                                                Colors.grey.shade900,
                                            colorScheme: ColorScheme.light(
                                              primary: Colors
                                                  .blueGrey, // <-- SEE HERE
                                              onPrimary: HexColor(
                                                  'dee1ec'), // <-- SEE HERE
                                              onSurface: HexColor(
                                                  'dee1ec'), // <-- SEE HERE
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                primary: HexColor(
                                                    'dee1ec'), // button text color
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );
                                    if (Newdate == null) return;
                                    setState(() {
                                      date = Newdate;
                                      fecha.text =
                                          '${date.day}/${date.month}/${date.year}';
                                    });
                                  },
                                ),
                                hintText: 'Fecha',
                                hintStyle: GoogleFonts.oswald(
                                  fontSize: 20,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fillColor: HexColor('dee1ec'),
                                filled: true),
                            controller: fecha,
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              camposdetexto('Razon', razon, 25, TextInputType.multiline),
              SizedBox(
                height: 10,
              ),
              camposdetexto('Telefono', telefono, 10, TextInputType.number),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
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
              child: Container(
                width: 200,
                child: TextField(
                  style: GoogleFonts.oswald(fontSize: 20, color: Colors.black),
                  keyboardType: keys,
                  decoration: InputDecoration(
                      hintText: texto,
                      hintStyle: GoogleFonts.oswald(
                        fontSize: 20,
                      ),
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
