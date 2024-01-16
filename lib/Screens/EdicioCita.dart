import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Datos/meeting.dart';

import '../Widgets/Agenda.dart';

class EdicionCita extends StatefulWidget {
  String nombre;
  String razon;
  DateTime fecha;
  String telefono;
  int index;
  EdicionCita(
      {super.key,
      required this.nombre,
      required this.fecha,
      required this.razon,
      required this.telefono,
      required this.index});

  @override
  State<EdicionCita> createState() => _EdicionCitaState();
}

final TextEditingController nombre = TextEditingController();
final TextEditingController razon = TextEditingController();
final TextEditingController telefono = TextEditingController();
final TextEditingController fecha = TextEditingController();

class _EdicionCitaState extends State<EdicionCita> {
  @override
  void initState() {
    //Hive.openBox<Cita>('cita');
    nombre.text = widget.nombre;
    razon.text = widget.razon;
    fecha.text = widget.fecha.toString();
    telefono.text = widget.telefono;

    super.initState();
  }

  @override
  DateTime date = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141d26'),
      appBar: AppBar(
        backgroundColor: HexColor('#243447'),
        title: Text('AUTOMOTRIZ MARTINEZ'),
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
                dismissDirection: DismissDirection.horizontal,
                shape: Border.all(width: 10),
                backgroundColor: Colors.white,
                content: Text(
                    'Todos los campos son necesarios para agendar una cita')));
          } else {
            final DateTime startTime = date;
            final cita = Hive.box<Cita>('citas');
            Cita datos = Cita(
                startTime: startTime,
                nombre: nombre.text,
                razon: razon.text,
                telefono: telefono.text,
                funcion: true);
            cita.putAt(widget.index, datos);
            nombre.text = '';
            fecha.text = '';
            razon.text = '';
            telefono.text = '';

            setState(() {});
            Navigator.pop(context);
          }
        },
        backgroundColor: HexColor('#C8D0D8'),
        label: Text(
          'Confirmar',
          style: GoogleFonts.montserrat(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          camposdetexto('Nombre', nombre, 10, TextInputType.name),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fecha',
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: HexColor('F2F2F2')),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                width: 200,
                child: TextFormField(
                  readOnly: true,
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
                                  dialogBackgroundColor: HexColor('#141d26'),
                                  colorScheme: ColorScheme.light(
                                    primary:
                                        HexColor('#243447'), // <-- SEE HERE
                                    onPrimary:
                                        HexColor('#F2F2F2'), // <-- SEE HERE
                                    onSurface:
                                        HexColor('#F2F2F2'), // <-- SEE HERE
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: HexColor(
                                          '#F2F2F2'), // button text color
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
                      border: InputBorder.none,
                      fillColor: HexColor('#C8D0D8'),
                      filled: true),
                  controller: fecha,
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          camposdetexto('Razon', razon, 25, TextInputType.multiline),
          SizedBox(
            height: 20,
          ),
          camposdetexto('Telefono', telefono, 10, TextInputType.number),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget camposdetexto(
      String texto, TextEditingController controlador, double espaciado, keys) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texto,
          style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: HexColor('F2F2F2')),
        ),
        SizedBox(
          width: espaciado,
        ),
        Container(
          width: 200,
          child: TextField(
            keyboardType: keys,
            decoration: InputDecoration(
                border: InputBorder
                    .none /*OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  // borderSide: BorderSide(color: Colors.black),
                ),*/
                ,
                fillColor: HexColor('#C8D0D8'),
                filled: true),
            controller: controlador,
          ),
        ),
      ],
    ));
  }
}
