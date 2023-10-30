import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<profile> {
  File? _imageFile;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nombreController.text = prefs.getString('nombre') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _descripcionController.text = prefs.getString('descripcion') ?? '';
      String imagePath = prefs.getString('imagen') ?? '';
      if (imagePath.isNotEmpty) {
        _imageFile = File(imagePath);
      }
    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombre', _nombreController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('descripcion', _descripcionController.text);
    if (_imageFile != null) {
      String imagePath = await _saveImage(_imageFile!);
      await prefs.setString('imagen', imagePath);
    }
  }

  Future<String> _saveImage(File image) async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String imagePath =
        path.join(appDocumentsDirectory.path, 'perfil_image.png');
    await image.copy(imagePath);
    return imagePath;
  }

  Future _getImage() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _getImage,
                child: const CircleAvatar(
                  radius: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration:
                  const InputDecoration(labelText: 'Correo Electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _saveProfileData();
                // Implementa cualquier otra lógica necesaria después de guardar los datos del perfil
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
