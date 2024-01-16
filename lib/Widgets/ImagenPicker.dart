import 'dart:io';
import 'package:Mecanico/Datos/imagenes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ImageModel {
  final String imagePath;

  ImageModel(this.imagePath);
}

class ImagenPicker_ extends StatefulWidget {
  const ImagenPicker_({Key? key}) : super(key: key);

  @override
  _ImagenPickerState createState() => _ImagenPickerState();
}

class _ImagenPickerState extends State<ImagenPicker_> {
  late Box<ImageModel> _imageBox;
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath.isEmpty)
              Text(
                'Seleccione una imagen',
                style: TextStyle(fontSize: 20),
              )
            else
              Image.file(
                File(imagePath),
                height: 300,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final pickedFile = await _picker.getImage(
                      source: ImageSource.camera,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        imagePath = pickedFile.path;

                        // _imageBox.put('selectedImage', ImageModel(imagePath));
                      });
                    }
                  },
                  label: Icon(
                    Icons.camera_alt,
                    size: 30,
                  ),
                  backgroundColor: Colors.black,
                ),
                SizedBox(width: 20),
                FloatingActionButton.extended(
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final pickedFile = await _picker.getImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        imagePath = pickedFile.path;
                      });
                    }
                  },
                  label: Icon(
                    Icons.photo,
                    size: 30,
                  ),
                  backgroundColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
