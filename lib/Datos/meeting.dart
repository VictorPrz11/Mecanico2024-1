import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class Cita {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String razon;
  @HiveField(2)
  String telefono = '';
  @HiveField(3)
  DateTime startTime;
  @HiveField(4)
  bool funcion;

  Cita(
      {required this.nombre,
      required this.razon,
      required this.telefono,
      required this.startTime,
      required this.funcion});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'razon': razon,
      'startTime': startTime,
      'funcion': funcion
    };
  }

  @override
  String toString() {
    return 'Meeting{nombre: $nombre, razon: $razon, telefono: $telefono, inicio: $startTime, funcion: $funcion}';
  }
}

class CitaAdapter extends TypeAdapter<Cita> {
  @override
  Cita read(BinaryReader reader) {
    return Cita(
        nombre: reader.read(),
        razon: reader.read(),
        telefono: reader.read(),
        startTime: reader.read(),
        funcion: reader.read());
  }

  //Hay que cambiarlo para cada clase
  //En otras plabras esta clase producto
  //le toca el typeId 0
  //Si tienes Gato le toca el typeId 1
  //Si tienes Perro le toca el typeId 2
  //Si tienes Caballo le toca el typeId 3
  //...
  @override
  int get typeId => 2;
  @override
  void write(BinaryWriter writer, Cita obj) {
    writer.write(obj.nombre);
    writer.write(obj.razon);
    writer.write(obj.telefono);
    writer.write(obj.startTime);
    writer.write(obj.funcion);
  }
}
