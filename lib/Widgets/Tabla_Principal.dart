import 'package:Mecanico/Screens/Vehiculo.dart';
import 'package:Mecanico/Screens/cliente_buscar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:Mecanico/Datos/meeting.dart';
import 'package:Mecanico/Datos/vehiculo_datos.dart';
import 'package:Mecanico/Screens/Crear_Cita.dart';
import 'package:Mecanico/Screens/checkboxstate.dart';
import 'package:Mecanico/Widgets/Agenda.dart';
import 'package:Mecanico/Widgets/GenerarPdf.dart';
import 'package:Mecanico/Widgets/ImagenPicker.dart';
import 'package:Mecanico/Widgets/Principal_sin_datos.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:Mecanico/Screens/formulario.dart';
import '../Screens/crear_cliente.dart';
import '../Screens/llenadonuevo.dart';

class tabla_principal extends StatefulWidget {
  const tabla_principal({super.key});

  @override
  State<tabla_principal> createState() => _tabla_principalState();
}

class _tabla_principalState extends State<tabla_principal> {
  @override
  Widget build(BuildContext context) {
    var fuente = GoogleFonts.roboto(color: Colors.white, fontSize: 18);
    Hive.openBox("vehiculo");
    var vehiculoBox = Hive.box('vehiculo');
    return Expanded(
        flex: 1,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor('#dee1ec')),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //alignment: Alignment.topCenter,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        ' Autos en taller',
                        style: GoogleFonts.oswald(
                            color: Colors.white, fontSize: 25),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Agenda();
                            },
                          );
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.black54,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          _launchUrl(
                              'https://www.repuve-consultar.com/consulta-ciudadana');
                        },
                        icon: Icon(
                          Icons.car_crash,
                          color: Colors.black54,
                          size: 30,
                        )),
                    IconButton(
                        iconSize: 35,
                        onPressed: () {
                          _launchUrl('https://www.mercadolibre.com.mx/');
                        },
                        icon: Image.asset('assets/mercadolibre.png'))
                  ],
                ),
              ),
              Container(child: verificacion()),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget textotabla(String texto, double espaciado) {
    return Column(
      children: [
        SizedBox(
          height: espaciado,
        ),
        Container(
          child: Text(texto,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: HexColor('#F2F2F2'),
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
        )
      ],
    );
  }

  Widget verificacion() {
    var box = Hive.box('clientes');
    if (box.isEmpty) {
      return Principal_sin_datos();
    } else {
      return datosTabla();
    }
  }

  Widget datosTabla() {
    Hive.openBox('clientes');
    var box = Hive.box('clientes');
    var list = box.values.toList();
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: list
            .map(
              (cliente) => Container(
                  padding: EdgeInsets.all(5),
                  height: 130,
                  child: Card(
                    color: HexColor('#dee1ec'),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VehiculoPage(cliente: cliente),
                              )).then((value) {
                            setState(() {});
                          });
                        },
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                height: 100,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Cliente: ${cliente.nombre} ',
                                            style: GoogleFonts.oswald(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Vehiculo: ${cliente.vehiculos.marca} ${cliente.vehiculos.modelo}  ',
                                            style: GoogleFonts.oswald(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Placas: ${cliente.vehiculos.placas} Vin: ${cliente.vehiculos.vin}',
                                            style: GoogleFonts.oswald(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ])),
                  )),
            )
            .toList(),
      ),
    );
  }

  void actualizar() {
    setState(() {});
  }

  Future<void> clearHiveBox() async {
    // Abre la base de datos Hive y la asocia con una instancia de HiveBox
    final box = await Hive.openBox('vehiculo');

    // Elimina todos los datos de la HiveBox
    await box.clear();

    setState(() {});
  }

  _launchUrl(String link) {
    launchUrlString(link, mode: LaunchMode.externalApplication);
  }
}
