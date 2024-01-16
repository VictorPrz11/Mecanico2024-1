import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class ImagenModel extends HiveObject {
  @HiveField(0)
  late String imagePath;

  ImagenModel({required this.imagePath});
}

class ImageAdapter extends TypeAdapter<ImagenModel> {
  @override
  ImagenModel read(BinaryReader reader) {
    return ImagenModel(imagePath: reader.read());
  }

  @override
  int get typeId => 3;
  @override
  void write(BinaryWriter writer, ImagenModel obj) {
    writer.write(obj.imagePath);
  }
}
