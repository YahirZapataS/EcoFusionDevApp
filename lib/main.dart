import 'dart:js';

import 'package:flutter_application_1/login.dart';

import 'profile.dart';
import 'helpPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

void _signOut() {
  Navigator.pushReplacement(
    context as BuildContext,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoFusion Store"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Lateral',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile()),
                );
              },
            ),
            ListTile(
              title: const Text('Ayuda'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => helpPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
                _signOut();
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                  "https://imgs.search.brave.com/uqjxK0hzttrcadan1hbNgaIdAE8da3OGRRxz1-KzmZ8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/ZWNvZnVzaW9uLmJl/L2Fzc2V0cy9pbWcv/c2FtZW53ZXJraW5n/LzEuanBn")),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Esta es otra parte del contenido"),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text("Y aun más contenido"),
          )
        ],
      ),
    );
  }
}
