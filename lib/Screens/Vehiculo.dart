import 'package:Mecanico/Datos/cliente_datos.dart';
import 'package:Mecanico/Datos/imagenes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VehiculoPage extends StatefulWidget {
  final Clientes cliente;
  VehiculoPage({super.key, required this.cliente});

  @override
  State<VehiculoPage> createState() => _VehiculoPageState();
}

class _VehiculoPageState extends State<VehiculoPage> {
  double _progressValue = 0;
  @override
  void initState() {
    super.initState();
    // Simula una carga de datos que actualiza el valor de _progressValue
    _simulateLoading();
  }

  void _simulateLoading() async {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(Duration(milliseconds: 10));
      setState(() {
        _progressValue = i.toDouble();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('clientes');
    var r = box.get(widget.cliente);

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        appBar: AppBar(
            // centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.cliente.vehiculos.placas),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                    onPressed: () {
                      EliminarCliente();
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 40.0)),
            )),
        body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  child: widget.cliente.imagenes != null
                      ? Container(
                          child:
                              Image.asset(widget.cliente.imagenes.toString()))
                      : Container(
                          alignment: Alignment.center,
                          child: Text(
                            'No hay imagenes del vehiculo',
                            style: GoogleFonts.oswald(
                                fontSize: 25,
                                color: Colors.white54,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
              Container(
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    Text(
                      'Kilometraje: ${widget.cliente.vehiculos.kms}kms ',
                      style: GoogleFonts.oswald(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey.shade800,
                      valueColor: AlwaysStoppedAnimation(
                        Colors.white,
                      ),
                      value: _progressValue / 100,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 10,
                      height: 200,
                    ),
                    Text(
                      'Cliente: ${widget.cliente.nombre} ',
                      style: GoogleFonts.oswald(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 150,
                      width: 145,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(5)),
                      child: ListView(
                          // leading: Icon(Icons.car_repair),
                          children: [
                            Text(
                              'Datos Vehiculo',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Marca: ${widget.cliente.vehiculos.marca}\nModelo: ${widget.cliente.vehiculos.modelo}\nColor: ${widget.cliente.vehiculos.color}\nMotor: ${widget.cliente.vehiculos.motor}\nVin: ${widget.cliente.vehiculos.vin}\nPlacas: ${widget.cliente.vehiculos.placas}',
                              style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 150,
                      width: 145,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(5)),
                      child: ListView(
                          // leading: Icon(Icons.car_repair),
                          children: [
                            Text(
                              'Datos Cliente',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Telefono: ${widget.cliente.telefono}\nDomicilio: ${widget.cliente.domicilio}\nCiudad: ${widget.cliente.ciudad}',
                              style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ]),
                    )
                  ])
            ])));
  }

  void EliminarCliente() {
    var clientes = Hive.box('clientes');
    var m = clientes.values.toList();
    var c = m.indexOf(widget.cliente);
    clientes.deleteAt(c);

    Navigator.pop(context);
  }
}
