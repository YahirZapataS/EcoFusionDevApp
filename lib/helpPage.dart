import 'package:flutter/material.dart';

class helpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Preguntas Frecuentes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPreguntaRespuesta(
                '¿Cómo hago algo?', 'Puedes hacer algo así...'),
            _buildPreguntaRespuesta('¿Cómo cambio mi contraseña?',
                'Para cambiar tu contraseña, sigue estos pasos...'),
            // Agrega más preguntas y respuestas según sea necesario
          ],
        ),
      ),
    );
  }

  Widget _buildPreguntaRespuesta(String pregunta, String respuesta) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          pregunta,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(respuesta),
        Divider(height: 20, color: Colors.grey),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      title: 'Ayuda+',
      home: helpPage(),
    ));
