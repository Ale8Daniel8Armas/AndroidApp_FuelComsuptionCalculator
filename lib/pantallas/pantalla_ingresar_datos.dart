import 'package:flutter/material.dart';
import 'CalcularResultadosPage.dart';

class IngresarDatosPage extends StatelessWidget {
  // Controladores para las entradas
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _precioLitroController = TextEditingController();
  final TextEditingController _dineroGastadoController = TextEditingController();
  final TextEditingController _horasController = TextEditingController();
  final TextEditingController _minutosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingreso de datos - La Carretera'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: Icon(
                Icons.add_road,
                size: 90,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40.0),
            TextFormField(
              controller: _kmController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Kilómetros recorridos',
                icon: Icon(Icons.directions_car),
              ),
            ),
            const SizedBox(height: 20.0),

            TextFormField(
              controller: _precioLitroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio por litro de gasolina',
                icon: Icon(Icons.local_gas_station),
              ),
            ),
            const SizedBox(height: 20.0),

            TextFormField(
              controller: _dineroGastadoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Dinero gastado en el viaje',
                icon: Icon(Icons.monetization_on),
              ),
            ),
            const SizedBox(height: 20.0),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _horasController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Horas',
                      icon: Icon(Icons.timer),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: TextFormField(
                    controller: _minutosController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Minutos',
                      icon: Icon(Icons.timer),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_validarDatos(context)) {
                    double km = double.tryParse(_kmController.text.trim()) ?? 0.0;
                    double precioLitro = double.tryParse(_precioLitroController.text.trim()) ?? 0.0;
                    double dineroGastado = double.tryParse(_dineroGastadoController.text.trim()) ?? 0.0;
                    int horas = int.tryParse(_horasController.text.trim()) ?? 0;
                    int minutos = int.tryParse(_minutosController.text.trim()) ?? 0;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalcularResultadosPage(
                          km: km,
                          precioLitro: precioLitro,
                          dineroGastado: dineroGastado,
                          horas: horas,
                          minutos: minutos,
                        ),
                      ),
                    );
                  }
                },

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),

                child: const Text(
                  'Guardar datos',
                  style: TextStyle(
                    color: Colors.white, // Cambia el texto a blanco
                    fontSize: 18, // Tamaño de fuente más grande
                    fontWeight: FontWeight.bold, // Texto en negrita
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}


  /// Validacion de datos
  bool _validarDatos(BuildContext context) {
    String mensajeError = '';
    if (_kmController.text.trim().isEmpty || double.tryParse(_kmController.text.trim()) == null) {
      mensajeError = 'Por favor, ingresa un valor válido para los kilómetros.';
    } else if (_precioLitroController.text.trim().isEmpty ||
        double.tryParse(_precioLitroController.text.trim()) == null) {
      mensajeError = 'Por favor, ingresa un precio válido por litro.';
    } else if (_dineroGastadoController.text.trim().isEmpty ||
        double.tryParse(_dineroGastadoController.text.trim()) == null ||
        double.parse(_dineroGastadoController.text.trim()) < 0) {
      mensajeError = 'Por favor, ingresa un valor válido para el dinero gastado.';
    } else if (_horasController.text.trim().isEmpty ||
        int.tryParse(_horasController.text.trim()) == null ||
        int.parse(_horasController.text.trim()) < 0 ||
        int.parse(_horasController.text.trim()) > 60) {
      mensajeError = 'Por favor, ingresa un valor válido para las horas (0-60).';
    } else if (_minutosController.text.trim().isEmpty ||
        int.tryParse(_minutosController.text.trim()) == null ||
        int.parse(_minutosController.text.trim()) < 0 ||
        int.parse(_minutosController.text.trim()) > 60) {
      mensajeError = 'Por favor, ingresa un valor válido para los minutos (0-60).';
    }

    if (mensajeError.isNotEmpty) {
      _mostrarError(context, mensajeError);
      return false;
    }

    return true;
  }

  void _mostrarError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error en los datos'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
