import 'package:Mecanico/Screens/llenadonuevo.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Datos/cliente_datos.dart';
import '../Datos/vehiculo_datos.dart';

class cliente_buscar extends StatefulWidget {
  const cliente_buscar({super.key});

  @override
  State<cliente_buscar> createState() => _cliente_buscarState();
}

class _cliente_buscarState extends State<cliente_buscar> {
  final TextEditingController telefono = TextEditingController();
  Clientes? clienteEncontrado;
  @override
  Widget build(BuildContext context) {
    void buscarClientePorTelefono() {
      var clientesBox = Hive.box('clientes');
      bool encontrado = false;

      for (Clientes cliente in clientesBox.values) {
        if (cliente != null && cliente.telefono == telefono.text ||
            cliente.nombre == telefono.text) {
          for (int i = 0; i < clientesBox.length; i++) {
            if (cliente == clientesBox.getAt(i)) {
              encontrado = true;
              clienteEncontrado = clientesBox.getAt(i);
              setState(() {});
              break;
            }
          }
        }
      }

      if (!encontrado) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            dismissDirection: DismissDirection.horizontal,
            behavior: SnackBarBehavior.fixed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              // side: BorderSide(color: Colors.grey, width: 0.5),
            ),
            backgroundColor: Colors.blueGrey,
            content: Text(
              'Ninguno cliente coincide con estos datos',
              style: GoogleFonts.oswald(
                color: HexColor('#FFFFFF'),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )));
        setState(() {
          clienteEncontrado = null;
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Servicio Automotriz',
            style: GoogleFonts.oswald(fontSize: 30),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 30.0)),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 220,
                        height: 60,
                        child: TextField(
                          style: GoogleFonts.oswald(
                            fontSize: 20,
                            // fontWeight: FontWeight.w600,
                            //  color: HexColor('dee1ec'),
                          ),
                          //expands: true,

                          controller: telefono,
                          textInputAction: TextInputAction.search,
                          onEditingComplete: () => buscarClientePorTelefono(),
                          decoration: InputDecoration(
                            hintText: 'Datos del cliente',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            filled: true,
                            fillColor: HexColor('dee1ec'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => buscarClientePorTelefono(),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 120,
                  child: Text('Buscar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                          fontSize: 25, color: Colors.black)),
                ),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: HexColor('dee1ec')),
              ),
              if (clienteEncontrado != null) ...[
                SizedBox(height: 30),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Cliente registrado',
                        style: GoogleFonts.oswald(
                          color: HexColor('#ffffff'),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ])),
                SizedBox(height: 20),
                camposdetexto('Nombre', clienteEncontrado!.nombre, 25,
                    TextInputType.name),
                camposdetexto('Domicilio', clienteEncontrado!.domicilio, 25,
                    TextInputType.name),
                camposdetexto('Ciudad', clienteEncontrado!.ciudad, 25,
                    TextInputType.name),
                camposdetexto('Telefono', clienteEncontrado!.telefono, 25,
                    TextInputType.name),
                SizedBox(height: 20),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Auto registrado',
                        style: GoogleFonts.oswald(
                          color: HexColor('#ffffff'),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ])),
                SizedBox(height: 20),
                camposdetexto('Marca', clienteEncontrado!.vehiculos.marca, 25,
                    TextInputType.name),
                camposdetexto('Modelo', clienteEncontrado!.vehiculos.modelo, 25,
                    TextInputType.multiline),
                camposdetexto('Año', clienteEncontrado!.vehiculos.year, 25,
                    TextInputType.multiline),
                camposdetexto("Motor", clienteEncontrado!.vehiculos.motor, 25,
                    TextInputType.multiline),
                camposdetexto('Color', clienteEncontrado!.vehiculos.color, 25,
                    TextInputType.multiline),
                camposdetexto('Placas', clienteEncontrado!.vehiculos.placas, 25,
                    TextInputType.multiline),
                camposdetexto('Kms', clienteEncontrado!.vehiculos.kms, 25,
                    TextInputType.multiline),
                camposdetexto('Servicio', clienteEncontrado!.vehiculos.servicio,
                    25, TextInputType.multiline),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return llenados(telefono: telefono.text);
                      },
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Text('Llenado formulario',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.oswald(
                            fontSize: 20, color: Colors.black)),
                  ),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: HexColor('dee1ec')),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ],
          )),
        ));
  }

  Widget camposdetexto(
      String texto, clienteEncontrado, double espaciado, keys) {
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
                    fontSize: 20,
                    //fontWeight: FontWeight.w600,
                    color: HexColor('F2F2F2')),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 220,
              child: TextField(
                keyboardType: keys,
                readOnly: true,
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  //fontWeight: FontWeight.w600, color: HexColor('F2F2F2')
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: HexColor('dee1ec'),
                  filled: true,
                ),
                controller:
                    TextEditingController(text: clienteEncontrado.toString()),
              ),
            ),
          ],
        ));
  }
}
