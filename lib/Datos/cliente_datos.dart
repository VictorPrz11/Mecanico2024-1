import 'package:Mecanico/Datos/imagenes.dart';
import 'package:Mecanico/Widgets/ImagenPicker.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Datos/vehiculo_datos.dart';
import 'package:image_picker/image_picker.dart';

@HiveType(typeId: 0)
class Clientes {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String domicilio = '';
  @HiveField(2)
  String ciudad = '';
  @HiveField(3)
  String telefono = '';
  @HiveField(4)
  Vehiculo vehiculos = Vehiculo(
      marca: '',
      modelo: '',
      year: '',
      motor: '',
      color: '',
      vin: '',
      kms: '',
      placas: '',
      servicio: '');
  @HiveField(5)
  String recibido;
  @HiveField(6)
  List<ImagenModel>? imagenes = [];

  Clientes(
      {required this.nombre,
      required this.domicilio,
      required this.ciudad,
      required this.telefono,
      required this.vehiculos,
      required this.recibido,
      this.imagenes});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'domicilio': domicilio,
      'ciudad': ciudad,
      'telefono': telefono,
      'vehiculos': vehiculos,
      'Imagenes': imagenes
    };
  }

  @override
  String toString() {
    return 'Cliente{nombre: $nombre, domicilio: $domicilio, ciudad: $ciudad,telefono: $telefono, vehiculos: $vehiculos, fecha recibido: $recibido, Imagenes: $imagenes}';
  }

  void crear({required Vehiculo vehiculo}) {
    Clientes cliente = Clientes(
        nombre: this.nombre,
        domicilio: this.domicilio,
        ciudad: this.ciudad,
        telefono: this.telefono,
        vehiculos: this.vehiculos,
        recibido: this.recibido,
        imagenes: this.imagenes);
  }
}

class ClientesAdapter extends TypeAdapter<Clientes> {
  @override
  Clientes read(BinaryReader reader) {
    return Clientes(
        nombre: reader.read(),
        domicilio: reader.read(),
        ciudad: reader.read(),
        telefono: reader.read(),
        vehiculos: reader.read(),
        recibido: reader.read(),
        imagenes: reader.read());
  }

  @override
  int get typeId => 0;
  @override
  void write(BinaryWriter writer, Clientes obj) {
    writer.write(obj.nombre);
    writer.write(obj.domicilio);
    writer.write(obj.ciudad);
    writer.write(obj.telefono);
    writer.write(obj.vehiculos);
    writer.write(obj.recibido);
    writer.write(obj.imagenes);
  }
}
