import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Widgets/GenerarPdf.dart';

import '../Datos/cliente_datos.dart';
import 'mainScreen.dart';

class llenados extends StatefulWidget {
  final String telefono;

  const llenados({super.key, required this.telefono});

  @override
  _llenadosState createState() => _llenadosState();
}

class _llenadosState extends State<llenados> {
  final controller = ScrollController();
  final itemKey = GlobalKey();
  final itemkeyfre = GlobalKey();
  final itemKeysusp = GlobalKey();
  final itemKeyHidraulica = GlobalKey();
  final itemKeyMotor = GlobalKey();
  final itemKeyEnfriamento = GlobalKey();
  final itemKeycoment = GlobalKey();
  Future scrollToitem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  Future scrollToitemfre() async {
    final context = itemkeyfre.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  Future scrollToitemsusp() async {
    final context = itemKeysusp.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  Future scrollToitemhidraulica() async {
    final context = itemKeyHidraulica.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  Future scrollToitemmotor() async {
    final context = itemKeyMotor.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  Future scrollToitemenfria() async {
    final context = itemKeyEnfriamento.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  Future scrolltocoment() async {
    final context = itemKeycoment.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  bool bujias4 = false;
  bool bujias6 = false;
  bool bujias8 = false;
  bool aire = false;
  bool aceite = false;
  bool Gasolina = false;
  bool aceite4 = false;
  bool aceite5 = false;
  bool aceite6 = false;
  bool Carbln = false;
  bool cables = false;
  bool liq = false;
  bool Tapa = false;
  bool PCV = false;
  bool rotor = false;
  bool Anticogelante = false;
  bool Aceitedir = false;
  bool Aceitetrans = false;
/////////////////////////////////////////////////////////////////////servicio de frenos inicio no se pudo esar el check tipo widget.... toco a mano
  bool delsi = false;
  bool delno = false;
  bool bal14 = false;
  bool bal24 = false;
  bool bal34 = false;
  bool zapasi = false;
  bool zapano = false;
  bool balzapa14 = false;
  bool balzapa24 = false;
  bool balzapa34 = false;

  bool discofre = false;
  bool reti = false;
  bool izq = false;
  bool der = false;
  bool disco1 = false;
  bool reti1 = false;
  bool izq1 = false;
  bool der1 = false;
  bool tambor = false;

  bool caliper = false;
  bool goteo = false;
  bool izq2 = false;
  bool der2 = false;
  bool norm = false;

  bool caliper1 = false;
  bool goteo1 = false;
  bool norm1 = false;
  bool cilindro = false;
  bool izq3 = false;
  bool der3 = false;
/////////////////////////////////////////////////////////////////////////////////////////// servicio de suspencion
  bool terintizq = false;
  bool terintder = false;
  bool terextizq = false;
  bool terextder = false;
  bool rotinfizq = false;
  bool rotinfder = false;
  bool rotsupizq = false;
  bool rotsupder = false;

  bool amortdelizq = false;
  bool amortdelder = false;
  bool amorttraizq = false;
  bool amorttrader = false;
  bool hulesbarraizq = false;
  bool hulesbarrader = false;
  bool tornillosbarraizq = false;
  bool tornillosbarrader = false;
  bool horquillasizq = false;
  bool horquillasder = false;
  bool gomasamortdel = false;
  bool gomasamorttras = false;
  bool bujeshordel = false;
  bool bujeshortras = false;
  ////////////////////////////////////////////////////////////////////////////////////////servicio de direccion hidraulica
  bool fugasi = false;
  bool fugano = false;
  bool conruido = false;
  bool sinruido = false;

  bool mangrotasi = false;
  bool magrotano = false;
  bool fugaceitesi = false;
  bool fugaceiteno = false;

  bool mangrotasire = false;
  bool magrotanore = false;
  bool fugaceitesire = false;
  bool fugaceitenore = false;

  bool cremaizq = false;
  bool cremader = false;
/////////////////////////////////////////////////////////////////////////////////////////////////Motor
  bool bandatostada = false;
  bool bandachilla = false;
  bool bandarota = false;

  bool poleatens = false;
  bool polealoca = false;

  bool bombaguagot = false;
  bool bombaguachilla = false;
  bool bombaguafan = false;

  bool normalbomba = false;
  bool altabomba = false;
  bool bajabomba = false;

  bool tapapuntgotea = false;
  bool tapapuntnogotea = false;

  bool tapacartgotea = false;
  bool tapacartnogotea = false;

  bool monoblockgoteo = false;
  bool monoblocknogoteo = false;

  bool cadenatiemposuena = false;
  bool cadenatiemponosuena = false;

  bool retenciguedel = false;
  bool retenciguetras = false;
  bool retengoteo = false;
  bool retennogoteo = false;

  bool retenarbole = false;
  bool retenarbola = false;
  bool retenarbolgot = false;
  bool retenarbolnogot = false;
//////////////////////////////////////////////////////////////////////// enfriamento
  bool radiadortap = false;
  bool radiadornotap = false;
  bool anticogen = false;
  bool aguaen = false;

  bool bombaaguafuga = false;
  bool bombaaguanofuga = false;

  bool termo = false;
  bool notermo = false;

  bool mangrotas = false;
  bool mangnorotas = false;

  bool taponfuga = false;
  bool taponnofuga = false;

  bool abrazaderasrot = false;
  bool abrazaderasnorot = false;

  bool depositorot = false;
  bool depositonoroto = false;
  void enviarseleccionado(BuildContext context) {
    List<String> seleccionado = [];
    if (bujias4) {
      seleccionado.add('Bujias : 4');
    }
    if (bujias6) {
      seleccionado.add('Bujias : 6');
    }
    if (bujias8) {
      seleccionado.add('Bujias : 8');
    }
    if (aire) {
      seleccionado.add('Aire');
    }
    if (aceite) {
      seleccionado.add('Aceite');
    }
    if (Gasolina) {
      seleccionado.add('Gasolina');
    }
    if (aceite4) {
      seleccionado.add('Aceite: 4');
    }
    if (aceite5) {
      seleccionado.add('Aceite: 5');
    }
    if (aceite6) {
      seleccionado.add('Aceite: 6');
    }
    if (Carbln) {
      seleccionado.add('Carbln');
    }
    if (cables) {
      seleccionado.add('Cables');
    }
    if (liq) {
      seleccionado.add('liq.inj');
    }
    if (Tapa) {
      seleccionado.add('Tapa/Dist');
    }
    if (PCV) {
      seleccionado.add('PCV');
    }
    if (rotor) {
      seleccionado.add('Rotor');
    }
    if (Anticogelante) {
      seleccionado.add('Anticogelante');
    }
    if (Aceitedir) {
      seleccionado.add('Aceite Dir.hidraulica');
    }
    if (Aceitetrans) {
      seleccionado.add('Aceite de transmision');
    }
    ///////////////////////////////////////////////////////////////////77servicio de frenos
    if (delsi) {
      seleccionado.add('Balatas delanteras si');
    }
    if (delno) {
      seleccionado.add('Balatas delanteras no');
    }
    if (bal14) {
      seleccionado.add('Balatas de 1/4');
    }
    if (bal24) {
      seleccionado.add('Balatas de 2/4');
    }
    if (bal34) {
      seleccionado.add('Balatas de 3/4');
    }
    if (zapasi) {
      seleccionado.add('Balatas traseras(zapatas) si');
    }
    if (zapano) {
      seleccionado.add('Balatas traseras(zapatas) no');
    }
    if (balzapa14) {
      seleccionado.add('Zapatas de 1/4');
    }
    if (balzapa24) {
      seleccionado.add('Zapatas de 2/4');
    }
    if (balzapa34) {
      seleccionado.add('Zapatas de 3/4');
    }
    if (discofre) {
      seleccionado.add('Disco');
    }
    if (reti) {
      seleccionado.add('Retificacion');
    }
    if (izq) {
      seleccionado.add('Izquierda');
    }
    if (der) {
      seleccionado.add('Derecha');
    }
    if (disco1) {
      seleccionado.add('Disco');
    }
    if (reti1) {
      seleccionado.add('Retificacion');
    }
    if (tambor) {
      seleccionado.add('Tambor');
    }
    if (izq1) {
      seleccionado.add('Izquierda');
    }
    if (der1) {
      seleccionado.add('Derecha');
    }
    if (caliper) {
      seleccionado.add('caliper');
    }
    if (goteo) {
      seleccionado.add('Goteo');
    }
    if (izq2) {
      seleccionado.add('Izq');
    }
    if (der2) {
      seleccionado.add('Derecha');
    }
    if (norm) {
      seleccionado.add('Normal');
    }
    if (caliper1) {
      seleccionado.add('caliper');
    }
    if (goteo1) {
      seleccionado.add('Goteo');
    }
    if (izq3) {
      seleccionado.add('Izq');
    }
    if (der3) {
      seleccionado.add('Derecha');
    }
    if (norm1) {
      seleccionado.add('Normal');
    }
    if (cilindro) {
      seleccionado.add('Cilindro');
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (terintizq) {
      seleccionado.add('Terminal interior izq');
    }
    if (terintder) {
      seleccionado.add('Terminal interior  der');
    }
    if (terextizq) {
      seleccionado.add('Terminal exterior izq');
    }
    if (terextder) {
      seleccionado.add('Terminal exterior der');
    }
    if (rotinfizq) {
      seleccionado.add('Rotula Inferior izq');
    }
    if (rotinfder) {
      seleccionado.add('Rotula Inferior der');
    }
    if (rotsupizq) {
      seleccionado.add('Rotula superior izq');
    }
    if (rotsupder) {
      seleccionado.add('Rotula superior der');
    }
    ////////////////////////////////////////////////////////////////////////////////////////////
    if (amortdelizq) {
      seleccionado.add('Amortiguadores delanteros izq');
    }
    if (amortdelder) {
      seleccionado.add('Amortiguadores delanteros der');
    }
    if (amorttraizq) {
      seleccionado.add('Amortiguadores traseros izq');
    }
    if (amorttrader) {
      seleccionado.add('Amortiguadores traseros der');
    }
    if (hulesbarraizq) {
      seleccionado.add('Hueles de la barra Est.izq');
    }
    if (hulesbarrader) {
      seleccionado.add('Hueles de la barra Est.der');
    }
    if (tornillosbarraizq) {
      seleccionado.add('Tornillos de la barra Est.izq');
    }
    if (tornillosbarrader) {
      seleccionado.add('Tornillos de la barra Est.der');
    }
    if (horquillasizq) {
      seleccionado.add('Horquillas izq');
    }
    if (horquillasder) {
      seleccionado.add('Horquillas der');
    }
    if (gomasamortdel) {
      seleccionado.add('gomas de amort del');
    }
    if (gomasamortdel) {
      seleccionado.add('gomas de amort tras');
    }
    if (bujeshordel) {
      seleccionado.add('bujes de horquilla del');
    }
    if (bujeshortras) {
      seleccionado.add('bujes de horquilla tras');
    }
    ////////////////////////////////////////////////////////////////////////////////////////servicio de direccion hidraulica
    if (fugasi) {
      seleccionado.add('Fuga si');
    }
    if (fugano) {
      seleccionado.add('Fuga no');
    }
    if (conruido) {
      seleccionado.add('Con ruido');
    }
    if (sinruido) {
      seleccionado.add('Sin ruido');
    }
    if (mangrotasi) {
      seleccionado.add('Manguera rota si en linea de alta presion');
    }
    if (magrotano) {
      seleccionado.add('Manguera rota no en linea de alta presion');
    }
    if (fugaceitesi) {
      seleccionado.add('Fuga de aceite si en linea de alta presion');
    }
    if (fugaceiteno) {
      seleccionado.add('Fuga de aceite no en linea de alta presion');
    }
    if (mangrotasire) {
      seleccionado.add('Manguera rota si en linea de retorno');
    }
    if (magrotanore) {
      seleccionado.add('Manguera rota no en linea de retorno');
    }
    if (fugaceitesire) {
      seleccionado.add('Fuga de aceite si en linea de retorno');
    }
    if (fugaceitenore) {
      seleccionado.add('Fuga de aceite no en linea de retorno');
    }
    if (cremaizq) {
      seleccionado.add('Cremallera izq');
    }
    if (cremader) {
      seleccionado.add('Cremallera der');
    }
    /////////////////////////////////////////////////////////////////////////////Motor
    if (bandatostada) {
      seleccionado.add('Banda tostada');
    }
    if (bandachilla) {
      seleccionado.add('Banda chilla');
    }
    if (bandarota) {
      seleccionado.add('Banda rota');
    }
    if (poleatens) {
      seleccionado.add('Polea tensadora');
    }
    if (polealoca) {
      seleccionado.add('Polea loca');
    }
    if (bombaguagot) {
      seleccionado.add('Bomba de agua gotea');
    }
    if (bombaguachilla) {
      seleccionado.add('Bomba de agua chilla');
    }
    if (bombaguafan) {
      seleccionado.add('Bomba de agua fan clutch');
    }
    if (normalbomba) {
      seleccionado.add('Presion bomba de aceite normal');
    }
    if (altabomba) {
      seleccionado.add('Presion bomba de aceite Alta');
    }
    if (bajabomba) {
      seleccionado.add('Presion bomba de aceite baja');
    }
    if (tapapuntgotea) {
      seleccionado.add('Tapa de punteria gotea');
    }
    if (tapapuntnogotea) {
      seleccionado.add('Tapa de punteria no gotea');
    }
    if (tapacartgotea) {
      seleccionado.add('Tapa de carter gotea');
    }
    if (tapacartnogotea) {
      seleccionado.add('Tapa de carter no gotea');
    }
    if (monoblockgoteo) {
      seleccionado.add('Registro de monoblock gotea');
    }
    if (monoblocknogoteo) {
      seleccionado.add('Registro de monoblock no gotea');
    }
    if (cadenatiemposuena) {
      seleccionado.add('Cadena de tiempo suena');
    }
    if (cadenatiemponosuena) {
      seleccionado.add('Cadena de tiempo no suena');
    }
    if (retenciguedel) {
      seleccionado.add('Reten de cigueñal delantera');
    }
    if (retenciguetras) {
      seleccionado.add('Reten de cigueñal trasera');
    }
    if (retengoteo) {
      seleccionado.add('reten si gotea');
    }
    if (retennogoteo) {
      seleccionado.add('reten no gotea');
    }
    if (retenarbole) {
      seleccionado.add('reten de arbol E');
    }
    if (retenarbola) {
      seleccionado.add('reten de arbol A');
    }
    if (retenarbolgot) {
      seleccionado.add('reten de arbol gotea');
    }
    if (retenarbolnogot) {
      seleccionado.add('reten de arbol no gotea');
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (radiadortap) {
      seleccionado.add('Radiador tapado');
    }
    if (radiadornotap) {
      seleccionado.add('Radiador no tapado');
    }
    if (anticogen) {
      seleccionado.add('Anticogelante');
    }
    if (aguaen) {
      seleccionado.add('Agua');
    }
    if (bombaaguafuga) {
      seleccionado.add('fuga en la bomba de agua');
    }
    if (bombaaguanofuga) {
      seleccionado.add('no hay fuga en la bomba de agua');
    }
    if (termo) {
      seleccionado.add('Si hay termostato');
    }
    if (notermo) {
      seleccionado.add('No hay termostato');
    }
    if (mangrotas) {
      seleccionado.add('Mangueras rotas');
    }
    if (mangnorotas) {
      seleccionado.add('Mangueras no rotas');
    }
    if (taponfuga) {
      seleccionado.add('El tapon tiene fuga');
    }
    if (taponnofuga) {
      seleccionado.add('El tapon no tiene fuga');
    }
    if (abrazaderasrot) {
      seleccionado.add('Abrazaderas rotas');
    }
    if (abrazaderasnorot) {
      seleccionado.add('Abrazaderas no rotas');
    }
    if (depositorot) {
      seleccionado.add('El deposito esta roto');
    }
    if (depositonoroto) {
      seleccionado.add('El deposito no esta roto');
    }
    ///////////////////////   navigator push
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      // useSafeArea: true,
      context: context,
      builder: (context) {
        return GenerarPdf(
          caracteristicas: seleccionado,
          comentarios: comentarios.text,
          index: widget.telefono,
        );
      },
    );
  }

  TextEditingController comentarios = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141d26'),
      appBar: AppBar(
        backgroundColor: HexColor('#243447'),
        title: Container(
          child: Row(children: [
            Text(
              'AUTOMOTRIZ MARTINEZ',
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: () => enviarseleccionado(context),
              icon: Image.asset('assets/pdf.png'),
            ),
          ]),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 30.0)),
        ),
      ),
      body: formulario(),
      floatingActionButton: SpeedDial(
        backgroundColor: HexColor('#243447'),
        overlayOpacity: 0.6,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              backgroundColor: HexColor('#243447'),
              labelBackgroundColor: HexColor('#243447'),
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              label: "Comentarios",
              child: Icon(Icons.comment, color: Colors.white),
              onTap: scrolltocoment),
          SpeedDialChild(
              backgroundColor: HexColor('#243447'),
              labelBackgroundColor: HexColor('#243447'),
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              label: "Sistema de enfriamento",
              child: Icon(Icons.car_rental, color: Colors.white),
              onTap: scrollToitemenfria),
          SpeedDialChild(
              backgroundColor: HexColor('#243447'),
              labelBackgroundColor: HexColor('#243447'),
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              label: "Motor",
              child: Icon(Icons.car_rental, color: Colors.white),
              onTap: scrollToitemmotor),
          SpeedDialChild(
              backgroundColor: HexColor('#243447'),
              labelBackgroundColor: HexColor('#243447'),
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              label: "Direccion hidraulica",
              child: Icon(Icons.car_rental, color: Colors.white),
              onTap: scrollToitemhidraulica),
          SpeedDialChild(
              backgroundColor: HexColor('#243447'),
              labelBackgroundColor: HexColor('#243447'),
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              label: "Suspension",
              child: Icon(
                Icons.car_rental,
                color: Colors.white,
              ),
              onTap: scrollToitemsusp),
          SpeedDialChild(
              backgroundColor: HexColor('#243447'),
              labelBackgroundColor: HexColor('#243447'),
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              label: "Frenos",
              child: Icon(Icons.car_rental, color: Colors.white),
              onTap: scrollToitemfre),
          SpeedDialChild(
              backgroundColor: HexColor('#243447'),
              labelBackgroundColor: HexColor('#243447'),
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              label: "Afinacion Mayor",
              child: Icon(
                Icons.car_rental,
                color: Colors.white,
              ),
              onTap: scrollToitem),
        ],
      ),
    );
  }

  Widget formulario() {
    return ListView.builder(itemBuilder: (context, index) {
      return Column(children: [
        Container(
            child: Column(
          key: itemKey,
          children: [
            Textos('Afinacion Mayor', 30),
            Divider(
              color: Colors.white,
            ),
            Textos('Cambio de bujias', 20),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("4",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: bujias4,
                onChanged: (value) {
                  setState(() {
                    bujias4 = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("6",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: bujias6,
                onChanged: (value) {
                  setState(() {
                    bujias6 = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("8",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: bujias8,
                onChanged: (value) {
                  setState(() {
                    bujias8 = value!;
                  });
                }),
            Divider(
              color: Colors.white,
            ),
            Textos('Cambio de filtro', 20),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Aire",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: aire,
                onChanged: (value) {
                  setState(() {
                    aire = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Aceite",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: aceite,
                onChanged: (value) {
                  setState(() {
                    aceite = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Gasolina",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: Gasolina,
                onChanged: (value) {
                  setState(() {
                    Gasolina = value!;
                  });
                }),
            Divider(
              color: Colors.white,
            ),
            Textos('Cambio de aceite', 20),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("4",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: aceite4,
                onChanged: (value) {
                  setState(() {
                    aceite4 = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("5",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: aceite5,
                onChanged: (value) {
                  setState(() {
                    aceite5 = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("6",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: aceite6,
                onChanged: (value) {
                  setState(() {
                    aceite6 = value!;
                  });
                }),
            Divider(
              color: Colors.white,
            ),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Carbln",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: Carbln,
                onChanged: (value) {
                  setState(() {
                    Carbln = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Cables",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: cables,
                onChanged: (value) {
                  setState(() {
                    cables = value!;
                  });
                }),
            Divider(
              color: Colors.white,
            ),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Liq.inj",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: liq,
                onChanged: (value) {
                  setState(() {
                    liq = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Tapa/Dist",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: Tapa,
                onChanged: (value) {
                  setState(() {
                    Tapa = value!;
                  });
                }),
            Divider(
              color: Colors.white,
            ),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("PCV",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: PCV,
                onChanged: (value) {
                  setState(() {
                    PCV = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Rotor",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: rotor,
                onChanged: (value) {
                  setState(() {
                    rotor = value!;
                  });
                }),
            Divider(
              color: Colors.white,
            ),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Antcogelante",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: Anticogelante,
                onChanged: (value) {
                  setState(() {
                    Anticogelante = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Aceite Dir.hidraulica",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: Aceitedir,
                onChanged: (value) {
                  setState(() {
                    Aceitedir = value!;
                  });
                }),
            CheckboxListTile(
                side: BorderSide(width: 2, color: Colors.white),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                activeColor: Colors.green,
                title: Text("Aceite De Transmision",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                value: Aceitetrans,
                onChanged: (value) {
                  setState(() {
                    Aceitetrans = value!;
                  });
                }),
            Divider(
              color: Colors.white,
            ),
          ],
        )),
        /////////////////////////////////////////////////////////////////////////////////////////77servicio de freno
        Container(
          key: itemkeyfre,
          child: Column(
            children: [
              Textos('Servicio de frenos', 30),
              Divider(
                color: Colors.white,
              ),
              Textos('Balatas delanteras', 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Balatas delanteras Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: delsi,
                  onChanged: (value) {
                    setState(() {
                      delsi = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Balatas delanteras no",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: delno,
                  onChanged: (value) {
                    setState(() {
                      delno = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("1/4",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bal14,
                  onChanged: (value) {
                    setState(() {
                      bal14 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("2/4",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bal24,
                  onChanged: (value) {
                    setState(() {
                      bal24 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("3/4",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bal34,
                  onChanged: (value) {
                    setState(() {
                      bal34 = value!;
                    });
                  }),
              Textos('Balatas Traseras(zapatas)', 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Balatas traseras Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: zapasi,
                  onChanged: (value) {
                    setState(() {
                      zapasi = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Balatas traseras no",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: zapano,
                  onChanged: (value) {
                    setState(() {
                      zapano = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("1/4",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: balzapa14,
                  onChanged: (value) {
                    setState(() {
                      balzapa14 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("2/4",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: balzapa24,
                  onChanged: (value) {
                    setState(() {
                      balzapa24 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("3/4",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: balzapa34,
                  onChanged: (value) {
                    setState(() {
                      balzapa34 = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Disco",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: discofre,
                  onChanged: (value) {
                    setState(() {
                      discofre = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Retificacion",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: reti,
                  onChanged: (value) {
                    setState(() {
                      reti = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: izq,
                  onChanged: (value) {
                    setState(() {
                      izq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: der,
                  onChanged: (value) {
                    setState(() {
                      der = value!;
                    });
                  }),
              Divider(color: Colors.white),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Disco",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: disco1,
                  onChanged: (value) {
                    setState(() {
                      disco1 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Retificacion",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: reti1,
                  onChanged: (value) {
                    setState(() {
                      reti1 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Tambor",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: tambor,
                  onChanged: (value) {
                    setState(() {
                      tambor = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: izq1,
                  onChanged: (value) {
                    setState(() {
                      izq1 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: der1,
                  onChanged: (value) {
                    setState(() {
                      der1 = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Caliper",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: caliper,
                  onChanged: (value) {
                    setState(() {
                      caliper = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Goteo",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: goteo,
                  onChanged: (value) {
                    setState(() {
                      goteo = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: izq2,
                  onChanged: (value) {
                    setState(() {
                      izq2 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: der2,
                  onChanged: (value) {
                    setState(() {
                      der2 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Normal",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: norm,
                  onChanged: (value) {
                    setState(() {
                      norm = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Caliper",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: caliper1,
                  onChanged: (value) {
                    setState(() {
                      caliper1 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Goteo",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: goteo1,
                  onChanged: (value) {
                    setState(() {
                      goteo1 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: izq3,
                  onChanged: (value) {
                    setState(() {
                      izq3 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: der3,
                  onChanged: (value) {
                    setState(() {
                      der3 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Normal",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: norm1,
                  onChanged: (value) {
                    setState(() {
                      norm1 = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Cilindro",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: cilindro,
                  onChanged: (value) {
                    setState(() {
                      cilindro = value!;
                    });
                  }),
            ],
          ),
/////////////////////////////////////////////////////////////////////////////////////////////suspencion
        ),
        Container(
          key: itemKeysusp,
          child: Column(
            children: [
              Divider(
                color: Colors.white,
              ),
              Textos("Servicio de suspencion", 30),
              Divider(
                color: Colors.white,
              ),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Terminal interior izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: terintizq,
                  onChanged: (value) {
                    setState(() {
                      terintizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Terminal interior der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: terintder,
                  onChanged: (value) {
                    setState(() {
                      terintder = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Terminal interior izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: terextizq,
                  onChanged: (value) {
                    setState(() {
                      terextizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Terminal interior der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: terextder,
                  onChanged: (value) {
                    setState(() {
                      terextder = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Rotula inferior izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: rotinfizq,
                  onChanged: (value) {
                    setState(() {
                      rotinfizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Rotula inferior der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: rotinfder,
                  onChanged: (value) {
                    setState(() {
                      rotinfder = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Rotula superior izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: rotsupizq,
                  onChanged: (value) {
                    setState(() {
                      rotsupizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Rotula superior der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: rotsupder,
                  onChanged: (value) {
                    setState(() {
                      rotsupder = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Amortiguadores delanteros der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: amortdelder,
                  onChanged: (value) {
                    setState(() {
                      amortdelder = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Amortiguadores delanteros izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: amortdelizq,
                  onChanged: (value) {
                    setState(() {
                      amortdelizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Amortiguadores traseros izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: amorttraizq,
                  onChanged: (value) {
                    setState(() {
                      amorttraizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Amortiguadores traseros der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: amorttrader,
                  onChanged: (value) {
                    setState(() {
                      amorttrader = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Hules de la barra Est. izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: hulesbarraizq,
                  onChanged: (value) {
                    setState(() {
                      hulesbarraizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Hules de la barra Est. der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: hulesbarrader,
                  onChanged: (value) {
                    setState(() {
                      hulesbarrader = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Tornillos de la barra Est.izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: tornillosbarraizq,
                  onChanged: (value) {
                    setState(() {
                      tornillosbarraizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Tornillos de la barra Est.der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: tornillosbarrader,
                  onChanged: (value) {
                    setState(() {
                      tornillosbarrader = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Horquillas izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: horquillasizq,
                  onChanged: (value) {
                    setState(() {
                      horquillasizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Horquillas der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: horquillasder,
                  onChanged: (value) {
                    setState(() {
                      horquillasder = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Gomas amort del",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: gomasamortdel,
                  onChanged: (value) {
                    setState(() {
                      gomasamortdel = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Gomas amort tras",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: gomasamorttras,
                  onChanged: (value) {
                    setState(() {
                      gomasamorttras = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("bujes de horquilla del",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bujeshordel,
                  onChanged: (value) {
                    setState(() {
                      bujeshordel = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("bujes de horquilla tras",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bujeshortras,
                  onChanged: (value) {
                    setState(() {
                      bujeshortras = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              )
            ],
          ),
        ),
        ////////////////////////////////////////////////////////////////////////////////////////servicio de direccion hidraulica
        Container(
          child: Column(
            key: itemKeyHidraulica,
            children: [
              Divider(
                color: Colors.white,
              ),
              Textos("Servicio de direccion Hidraulica", 30),
              Divider(
                color: Colors.white,
              ),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Fuga si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: fugasi,
                  onChanged: (value) {
                    setState(() {
                      fugasi = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Fuga no",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: fugano,
                  onChanged: (value) {
                    setState(() {
                      fugano = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Con ruido",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: conruido,
                  onChanged: (value) {
                    setState(() {
                      conruido = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Sin ruido",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: sinruido,
                  onChanged: (value) {
                    setState(() {
                      sinruido = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Linea de alta presion", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Manguera rota si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: mangrotasi,
                  onChanged: (value) {
                    setState(() {
                      mangrotasi = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Manguera rota no",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: magrotano,
                  onChanged: (value) {
                    setState(() {
                      magrotano = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Con fuga si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: fugaceitesi,
                  onChanged: (value) {
                    setState(() {
                      fugaceitesi = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Con fuga no",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: fugaceiteno,
                  onChanged: (value) {
                    setState(() {
                      fugaceiteno = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Linea de retorno", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Manguera rota si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: mangrotasire,
                  onChanged: (value) {
                    setState(() {
                      mangrotasire = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Manguera rota no",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: magrotanore,
                  onChanged: (value) {
                    setState(() {
                      magrotanore = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Con fuga si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: fugaceitesire,
                  onChanged: (value) {
                    setState(() {
                      fugaceitesire = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Con fuga no",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: fugaceitenore,
                  onChanged: (value) {
                    setState(() {
                      fugaceitenore = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Cremallera de la direccion", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Cremallera izq",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: cremaizq,
                  onChanged: (value) {
                    setState(() {
                      cremaizq = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Cremallera der",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: cremader,
                  onChanged: (value) {
                    setState(() {
                      cremader = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
        //////////////////////////////////////////////////////////////////motor
        Container(
          child: Column(
            key: itemKeyMotor,
            children: [
              Divider(
                color: Colors.white,
              ),
              Textos("Motor", 30),
              Divider(
                color: Colors.white,
              ),
              Textos("Banda de alternador", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Tostada",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bandatostada,
                  onChanged: (value) {
                    setState(() {
                      bandatostada = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Chilla",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bandachilla,
                  onChanged: (value) {
                    setState(() {
                      bandachilla = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Rota",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bandarota,
                  onChanged: (value) {
                    setState(() {
                      bandarota = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Polea", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Polea tensadora",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: poleatens,
                  onChanged: (value) {
                    setState(() {
                      poleatens = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Polea Loca",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: polealoca,
                  onChanged: (value) {
                    setState(() {
                      polealoca = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Bomba de agua", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("gotea",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bombaguagot,
                  onChanged: (value) {
                    setState(() {
                      bombaguagot = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Chilla",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bombaguachilla,
                  onChanged: (value) {
                    setState(() {
                      bombaguachilla = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Fan clutch",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bombaguafan,
                  onChanged: (value) {
                    setState(() {
                      bombaguafan = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Presion bomba de aceite", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Normal",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: normalbomba,
                  onChanged: (value) {
                    setState(() {
                      normalbomba = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Alta",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: altabomba,
                  onChanged: (value) {
                    setState(() {
                      altabomba = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Baja",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bajabomba,
                  onChanged: (value) {
                    setState(() {
                      bajabomba = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Tapa de punterias(goteo)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: tapapuntgotea,
                  onChanged: (value) {
                    setState(() {
                      tapapuntgotea = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: tapapuntnogotea,
                  onChanged: (value) {
                    setState(() {
                      tapapuntnogotea = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Tapa del carter (goteo)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: tapacartgotea,
                  onChanged: (value) {
                    setState(() {
                      tapacartgotea = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: tapacartnogotea,
                  onChanged: (value) {
                    setState(() {
                      tapacartnogotea = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Registro de monoblock (goteo)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: monoblockgoteo,
                  onChanged: (value) {
                    setState(() {
                      monoblockgoteo = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: monoblocknogoteo,
                  onChanged: (value) {
                    setState(() {
                      monoblocknogoteo = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Cadena de tiempo (suena)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: cadenatiemposuena,
                  onChanged: (value) {
                    setState(() {
                      cadenatiemposuena = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: cadenatiemponosuena,
                  onChanged: (value) {
                    setState(() {
                      cadenatiemponosuena = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Reten de cigueñal", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("del",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retenciguedel,
                  onChanged: (value) {
                    setState(() {
                      retenciguedel = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Tras",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retenciguetras,
                  onChanged: (value) {
                    setState(() {
                      retenciguetras = value!;
                    });
                  }),
              Textos("Gotea", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retengoteo,
                  onChanged: (value) {
                    setState(() {
                      retengoteo = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retennogoteo,
                  onChanged: (value) {
                    setState(() {
                      retennogoteo = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Reten de arbol de levas", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Arbol E",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retenarbole,
                  onChanged: (value) {
                    setState(() {
                      retenarbole = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Arbol A",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retenarbola,
                  onChanged: (value) {
                    setState(() {
                      retenarbola = value!;
                    });
                  }),
              Textos("Gotea", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retenarbolgot,
                  onChanged: (value) {
                    setState(() {
                      retenarbolgot = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: retenarbolnogot,
                  onChanged: (value) {
                    setState(() {
                      retenarbolnogot = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
        /////////////////////////////////////////////////////sistema de enfriamento
        Container(
          child: Column(
            key: itemKeyEnfriamento,
            children: [
              Divider(
                color: Colors.white,
              ),
              Textos("Sistema de enfriamento", 30),
              Divider(
                color: Colors.white,
              ),
              Textos("Radiador tapado", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: radiadortap,
                  onChanged: (value) {
                    setState(() {
                      radiadortap = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: radiadornotap,
                  onChanged: (value) {
                    setState(() {
                      radiadornotap = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Anticogelante",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: anticogen,
                  onChanged: (value) {
                    setState(() {
                      anticogen = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Agua",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: aguaen,
                  onChanged: (value) {
                    setState(() {
                      aguaen = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Bomba de agua(fuga)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bombaaguafuga,
                  onChanged: (value) {
                    setState(() {
                      bombaaguafuga = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: bombaaguanofuga,
                  onChanged: (value) {
                    setState(() {
                      bombaaguanofuga = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("thermostato", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: termo,
                  onChanged: (value) {
                    setState(() {
                      termo = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: notermo,
                  onChanged: (value) {
                    setState(() {
                      notermo = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Mangueras(rotas)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: mangrotas,
                  onChanged: (value) {
                    setState(() {
                      mangrotas = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: mangnorotas,
                  onChanged: (value) {
                    setState(() {
                      mangnorotas = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Tapon(fuga)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: taponfuga,
                  onChanged: (value) {
                    setState(() {
                      taponfuga = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: taponnofuga,
                  onChanged: (value) {
                    setState(() {
                      taponnofuga = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Abrazaderas(rotas)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: abrazaderasrot,
                  onChanged: (value) {
                    setState(() {
                      abrazaderasrot = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: abrazaderasnorot,
                  onChanged: (value) {
                    setState(() {
                      abrazaderasnorot = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
              Textos("Deposito(roto)", 20),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("Si",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: depositorot,
                  onChanged: (value) {
                    setState(() {
                      depositorot = value!;
                    });
                  }),
              CheckboxListTile(
                  side: BorderSide(width: 2, color: Colors.white),
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  title: Text("No",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  value: depositonoroto,
                  onChanged: (value) {
                    setState(() {
                      depositonoroto = value!;
                    });
                  }),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            key: itemKeycoment,
            children: [
              Divider(
                color: Colors.white,
              ),
              Textos("Observaciones Generales", 28),
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                child: TextFormField(
                  controller: comentarios,
                  maxLines: 4,
                  style: TextStyle(
                      backgroundColor: Colors.white, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ]);
    });
  }

  Widget Textos(String texto, double tam) {
    return Text(
      texto,
      style: TextStyle(fontSize: tam, color: Colors.white),
    );
  }

  int buscarClientePorTelefono() {
    var clientesBox = Hive.box('clientes');
    bool encontrado = false;
    Clientes clienteEncontrado;

    for (Clientes cliente in clientesBox.values) {
      if (cliente != null && cliente.telefono == widget.telefono) {
        for (int i = 0; i < clientesBox.length; i++) {
          if (cliente == clientesBox.getAt(i)) {
            encontrado = true;
            clienteEncontrado = clientesBox.getAt(i);

            setState(() {});
            return i;
            break;
          }
        }
      }
    }
    return -1;
  }

  void updateText() {
    setState(() {});
  }
}
