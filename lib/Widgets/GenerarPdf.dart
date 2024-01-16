import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Screens/Crear_Cita.dart';
import 'package:Mecanico/Widgets/Tabla_Principal.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Datos/cliente_datos.dart';

class GenerarPdf extends StatefulWidget {
  final List<String> caracteristicas;
  final String index;
  final comentarios;
  const GenerarPdf({
    super.key,
    required this.index,
    required this.caracteristicas,
    this.comentarios,
  });

  @override
  State<GenerarPdf> createState() => _GenerarPdfState();
}

class _GenerarPdfState extends State<GenerarPdf> {
  final TextEditingController nombrearchivo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var r;

    return Container(

        //alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 200,
        width: 400,
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Positioned(
                  child: Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade600,
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                //decoration: BoxDecoration(shape: BoxShape.circle),
                //color: Colors.grey[200],
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: nombrearchivo.text.isEmpty
                    ? TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: VentanaNombre(nombrearchivo, r));
                            },
                          );
                        },
                        child: Text(
                          'Ingresa el nombre del archivo',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ))
                    : TextButton(
                        style: ButtonStyle(
                          iconSize: MaterialStatePropertyAll(10),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: VentanaNombre(nombrearchivo, r));
                            },
                          );
                        },
                        child: Text(
                          nombrearchivo.text,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 60,
                          icon: Image.asset(
                            'assets/diskette.png',
                          ),
                          //title: Text('Guardar Local'),
                          onPressed: () async {
                            final pdfData = await generatePdf();

                            await Printing.layoutPdf(
                              onLayout: (format) => pdfData,
                            );
                          },
                        ),
                        Text('Guardar Local'),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 60,
                            onPressed: () async {
                              final pdfData = await generatePdf();

                              if (nombrearchivo.text.isNotEmpty) {
                                await Printing.sharePdf(
                                    bytes: pdfData,
                                    filename: '${nombrearchivo.text}.pdf');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                          'Ingresa el nombre del archivo en la parte superior')),
                                );
                              }
                            },
                            icon: Image.asset('assets/share.png')),
                        Text('Compartir'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget VentanaNombre(nombrearchivo, r) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 165,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]),
            alignment: Alignment.topCenter,
            child: Text(
              'Nombre archivo',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nombrearchivo,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear_rounded),
                onPressed: () {
                  nombrearchivo.text = '';
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                r = nombrearchivo.text;
                Navigator.pop(context);
              },
              child: Text(
                'Guardar',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  void actualizar() {
    setState(() {});
  }

  int buscarClientePorTelefono() {
    var clientesBox = Hive.box('clientes');
    bool encontrado = false;
    Clientes clienteEncontrado;

    for (Clientes cliente in clientesBox.values) {
      if (cliente != null && cliente.telefono == widget.index ||
          cliente.nombre == widget.index) {
        for (int i = 0; i < clientesBox.length; i++) {
          if (cliente == clientesBox.getAt(i)) {
            encontrado = true;
            clienteEncontrado = clientesBox.getAt(i);

            setState(() {});
            return i;
          }
        }
      }
    }
    return -1;
  }

  Future<Uint8List> generatePdf() async {
    var m = buscarClientePorTelefono();
    var clientes = Hive.box('clientes');
    var c = clientes.getAt(m);
    final pdf = pw.Document();

    final tableNombre = pw.Table.fromTextArray(
      headerAlignment: pw.Alignment.centerLeft,
      data: [
        ['Cliente: ${c.nombre}'],
      ],
    );
    final tableDomicilio =
        pw.Table.fromTextArray(headerAlignment: pw.Alignment.centerLeft, data: [
      ['Domicilio: ${c.domicilio}', 'Tel: ${c.telefono}'],
    ]);
    final tableCiudad =
        pw.Table.fromTextArray(headerAlignment: pw.Alignment.centerLeft, data: [
      ['Ciudad: ${c.ciudad}', 'Fecha: ${c.recibido}'],
    ]);
    final tableVehiculoH =
        pw.Table.fromTextArray(headerAlignment: pw.Alignment.centerLeft, data: [
      ['Datos generales del vehiculo']
    ]);
    final tableVehiculoDatos1 =
        pw.Table.fromTextArray(headerAlignment: pw.Alignment.centerLeft, data: [
      [
        'marca: ${c.vehiculos.marca}',
        'modelo: ${c.vehiculos.modelo}',
        'year:  ${c.vehiculos.year}',
        'motor:  ${c.vehiculos.motor}',
      ]
    ]);
    final tableVehiculoDatos2 =
        pw.Table.fromTextArray(headerAlignment: pw.Alignment.centerLeft, data: [
      [
        'color:  ${c.vehiculos.color}',
        'vin:  ${c.vehiculos.vin}',
        'kms:  ${c.vehiculos.kms}',
        'placas:  ${c.vehiculos.placas}',
      ],
    ]);

    // Ajusta el ancho de la tabla al ancho de la página

    final imagenHeader = pw.MemoryImage(
        (await rootBundle.load('assets/mecanico.png')).buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(build: (pw.Context context) {
        return [
          pw.Header(
            child: pw.Container(
                child: pw.Row(children: [
              pw.Container(
                  width: 80,
                  height: 100,
                  child: pw.Image(
                    imagenHeader,
                  )),
              pw.Container(
                  child: pw.Column(children: [
                pw.Text('Servicio Mecanico AUTOMOTRIZ MARTINEZ'),
                pw.Text(
                    'Especialista en Electronica de Aviacion Arturo E. Nieto Martinez.\nOaxaca #403, Col. Fco. Javier Mina C.p. 89318 Tampico Tamps.\nCel: 833 267 6594 y 833 312 7199, Email-Superarthus_74@outlook.com')
              ]))
            ])),
            //title: 'Servicio Mecanico AUTOMOTRIZ MARTINEZ'
          ),
          pw.Container(
              child: pw.Row(children: [
            pw.Container(
                width: PdfPageFormat.standard.availableWidth,
                child: pw.Column(children: [
                  tableNombre,
                  tableDomicilio,
                  tableCiudad,
                  tableVehiculoH,
                  tableVehiculoDatos1,
                  tableVehiculoDatos2,
                ])),
          ])),
          pw.Container(
              width: PdfPageFormat.standard.availableWidth,
              child: pw.Column(children: [
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      ['Afinacion Mayor Completa Cambio De'],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      for (String seleccionados in widget.caracteristicas)
                        if (seleccionados.contains('Bujias '))
                          ['Cambio de ${seleccionados}']
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        'Cambio de Filtro: ',
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Aire')
                            seleccionados
                          else if (seleccionados == 'Aceite')
                            seleccionados
                          else if (seleccionados == 'Gasolina')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      for (String seleccionados in widget.caracteristicas)
                        if (seleccionados.contains('Aceite: '))
                          ['Cambio de ${seleccionados}']
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Carbln')
                            seleccionados
                          else if (seleccionados == 'Cables')
                            seleccionados
                          else if (seleccionados == 'liq.inj')
                            seleccionados
                          else if (seleccionados == 'Tapa/Dist')
                            seleccionados
                          else if (seleccionados == 'PCV')
                            seleccionados
                          else if (seleccionados == 'Rotor')
                            seleccionados
                          else if (seleccionados == 'Anticogelante')
                            seleccionados
                          else if (seleccionados == 'Aceite Dir.hidraulica')
                            seleccionados
                          else if (seleccionados == 'Aceite de transmision')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      ['Servicio De Frenos']
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        'Balatas delanteras:',
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Balatas delanteras si')
                            seleccionados
                          else if (seleccionados == 'Balatas delanteras no')
                            seleccionados
                          else if (seleccionados == 'Balatas de 1/4')
                            seleccionados
                          else if (seleccionados == 'Balatas de 2/4')
                            seleccionados
                          else if (seleccionados == 'Balatas de 3/4')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        'Balatas Traseras (Zapatas):',
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Balatas traseras(zapatas) si')
                            seleccionados
                          else if (seleccionados ==
                              'Balatas traseras(zapatas) no')
                            seleccionados
                          else if (seleccionados == 'Zapatas de 1/4')
                            seleccionados
                          else if (seleccionados == 'Zapatas de 2/4')
                            seleccionados
                          else if (seleccionados == 'Zapatas de 3/4')
                            seleccionados
                          else if (seleccionados == 'Disco')
                            seleccionados
                          else if (seleccionados == 'Retificacion')
                            seleccionados
                          else if (seleccionados == 'Izquierda')
                            seleccionados
                          else if (seleccionados == 'Disco')
                            seleccionados
                          else if (seleccionados == 'Retificacion')
                            seleccionados
                          else if (seleccionados == 'Tambor')
                            seleccionados
                          else if (seleccionados == 'Izquierda')
                            seleccionados
                          else if (seleccionados == 'Derecha')
                            seleccionados
                          else if (seleccionados == 'caliper')
                            seleccionados
                          else if (seleccionados == 'Goteo')
                            seleccionados
                          else if (seleccionados == 'Izq')
                            seleccionados
                          else if (seleccionados == 'Derecha')
                            seleccionados
                          else if (seleccionados == 'Normal')
                            seleccionados
                          else if (seleccionados == 'caliper')
                            seleccionados
                          else if (seleccionados == 'Goteo')
                            seleccionados
                          else if (seleccionados == 'Izq')
                            seleccionados
                          else if (seleccionados == 'Derecha')
                            seleccionados
                          else if (seleccionados == 'Normal')
                            seleccionados
                          else if (seleccionados == 'Cilindro')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      ['Servicio De Suspension Cambio De:']
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Terminal interior izq')
                            seleccionados
                          else if (seleccionados == 'Terminal interior  der')
                            seleccionados
                          else if (seleccionados == 'Terminal exterior izq')
                            seleccionados
                          else if (seleccionados == 'Terminal exterior der')
                            seleccionados
                          else if (seleccionados == 'Rotula Inferior izq')
                            seleccionados
                          else if (seleccionados == 'Rotula Inferior der')
                            seleccionados
                          else if (seleccionados == 'Rotula superior izq')
                            seleccionados
                          else if (seleccionados == 'Rotula superior der')
                            seleccionados
                          else if (seleccionados ==
                              'Amortiguadores delanteros izq')
                            seleccionados
                          else if (seleccionados ==
                              'Amortiguadores delanteros der')
                            seleccionados
                          else if (seleccionados ==
                              'Amortiguadores traseros izq')
                            seleccionados
                          else if (seleccionados ==
                              'Amortiguadores traseros der')
                            seleccionados
                          else if (seleccionados ==
                              'Hueles de la barra Est.izq')
                            seleccionados
                          else if (seleccionados ==
                              'Hueles de la barra Est.der')
                            seleccionados
                          else if (seleccionados ==
                              'Tornillos de la barra Est.izq')
                            seleccionados
                          else if (seleccionados ==
                              'Tornillos de la barra Est.der')
                            seleccionados
                          else if (seleccionados == 'Horquillas izq')
                            seleccionados
                          else if (seleccionados == 'Horquillas der')
                            seleccionados
                          else if (seleccionados == 'gomas de amort del')
                            seleccionados
                          else if (seleccionados == 'gomas de amort tras')
                            seleccionados
                          else if (seleccionados == 'bujes de horquilla del')
                            seleccionados
                          else if (seleccionados == 'bujes de horquilla tras')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      ['Servicio De Direccion Hidraulica']
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Fuga si')
                            seleccionados
                          else if (seleccionados == 'Fuga no')
                            seleccionados
                          else if (seleccionados == 'Con ruido')
                            seleccionados
                          else if (seleccionados == 'Sin ruido')
                            seleccionados
                          else if (seleccionados ==
                              'Manguera rota si en linea de alta presion')
                            seleccionados
                          else if (seleccionados ==
                              'Manguera rota no en linea de alta presion')
                            seleccionados
                          else if (seleccionados ==
                              'Fuga de aceite si en linea de alta presion')
                            seleccionados
                          else if (seleccionados ==
                              'Fuga de aceite no en linea de alta presion')
                            seleccionados
                          else if (seleccionados ==
                              'Manguera rota si en linea de retorno')
                            seleccionados
                          else if (seleccionados ==
                              'Fuga de aceite si en linea de retorno')
                            seleccionados
                          else if (seleccionados ==
                              'Fuga de aceite no en linea de retorno')
                            seleccionados
                          else if (seleccionados == 'Cremallera izq')
                            seleccionados
                          else if (seleccionados == 'Cremallera der')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      [
                        'Condiciones De Motor',
                      ]
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Banda tostada')
                            seleccionados
                          else if (seleccionados == 'Banda chilla')
                            seleccionados
                          else if (seleccionados == 'Banda rota')
                            seleccionados
                          else if (seleccionados == 'Polea tensadora')
                            seleccionados
                          else if (seleccionados == 'Polea loca')
                            seleccionados
                          else if (seleccionados == 'Bomba de agua gotea')
                            seleccionados
                          else if (seleccionados == 'Bomba de agua chilla')
                            seleccionados
                          else if (seleccionados == 'Bomba de agua fan clutch')
                            seleccionados
                          else if (seleccionados ==
                              'Presion bomba de aceite normal')
                            seleccionados
                          else if (seleccionados ==
                              'Presion bomba de aceite Alta')
                            seleccionados
                          else if (seleccionados ==
                              'Presion bomba de aceite baja')
                            seleccionados
                          else if (seleccionados == 'Tapa de punteria gotea')
                            seleccionados
                          else if (seleccionados == 'Tapa de punteria no gotea')
                            seleccionados

                          /////////////////////////
                          else if (seleccionados == 'Tapa de carter gotea')
                            seleccionados
                          else if (seleccionados == 'Tapa de carter no gotea')
                            seleccionados
                          else if (seleccionados ==
                              'Registro de monoblock gotea')
                            seleccionados
                          else if (seleccionados ==
                              'Registro de monoblock no gotea')
                            seleccionados
                          else if (seleccionados == 'Cadena de tiempo suena')
                            seleccionados
                          else if (seleccionados == 'Cadena de tiempo no suena')
                            seleccionados
                          else if (seleccionados ==
                              'Reten de cigueñal delantera')
                            seleccionados
                          else if (seleccionados == 'Reten de cigueñal trasera')
                            seleccionados
                          else if (seleccionados == 'reten si gotea')
                            seleccionados
                          else if (seleccionados == 'reten no gotea')
                            seleccionados
                          else if (seleccionados == 'reten de arbol E')
                            seleccionados
                          else if (seleccionados == 'reten de arbol A')
                            seleccionados
                          else if (seleccionados == 'reten de arbol gotea')
                            seleccionados
                          else if (seleccionados == 'reten de arbol no gotea')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      [
                        'Sistema De Enfriamiento',
                      ]
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      [
                        for (String seleccionados in widget.caracteristicas)
                          if (seleccionados == 'Radiador tapado')
                            seleccionados
                          else if (seleccionados == 'Radiador no tapado')
                            seleccionados
                          else if (seleccionados == 'Anticogelante')
                            seleccionados
                          else if (seleccionados == 'Agua')
                            seleccionados
                          else if (seleccionados == 'fuga en la bomba de agua')
                            seleccionados
                          else if (seleccionados ==
                              'no hay fuga en la bomba de agua')
                            seleccionados
                          else if (seleccionados == 'Si hay termostato')
                            seleccionados
                          else if (seleccionados == 'No hay thermostato')
                            seleccionados
                          else if (seleccionados == 'Mangueras rotas')
                            seleccionados
                          else if (seleccionados == 'Mangueras no rotas')
                            seleccionados
                          else if (seleccionados == 'El tapon tiene fuga')
                            seleccionados
                          else if (seleccionados == 'El tapon no tiene fuga')
                            seleccionados
                          else if (seleccionados == 'Abrazaderas rotas')
                            seleccionados

                          /////////////////////////
                          else if (seleccionados == 'Abrazaderas no rotas')
                            seleccionados
                          else if (seleccionados == 'El deposito esta roto')
                            seleccionados
                          else if (seleccionados == 'El deposito no esta roto')
                            seleccionados
                      ],
                    ]),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      [
                        if (widget.comentarios != null)
                          'Comentarios:\n ' + widget.comentarios
                      ]
                    ]),
                pw.SizedBox(height: 10),
                pw.Text(
                    'Gracias por su preferencia le atendieron : Mecanico Arturo E. Nieto Martinez ____________________________\n'),
                pw.Table.fromTextArray(
                    headerAlignment: pw.Alignment.center,
                    data: [
                      [
                        '(1)Toda revision genera costos para su elaboracion.(2)Todas la piezas observadas durante la revision se encontraron como se explican. (3)La finalidad de'
                            'toda Revision es determinar el lugar donde se encuentra el problema, antes de generar cambios innecesarios.(4) si requiere re paraciones adicionales'
                            'aplican cargos adicionales.(5) Todos nuestros precios son +iva 16%.(6) En partes electricas no hay garantia de ninguna especie.'
                      ]
                    ]),
              ])),
        ];
      }),
    );

    return pdf.save();
  }
}
