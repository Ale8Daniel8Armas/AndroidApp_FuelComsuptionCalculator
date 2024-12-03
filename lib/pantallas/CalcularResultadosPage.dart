import 'package:flutter/material.dart';
import '../logica/calcular_consumo.dart';

class CalcularResultadosPage extends StatelessWidget {
  final double km;
  final double precioLitro;
  final double dineroGastado;
  final int horas;
  final int minutos;

  const CalcularResultadosPage({
    super.key,
    required this.km,
    required this.precioLitro,
    required this.dineroGastado,
    required this.horas,
    required this.minutos,
  });

  @override
  Widget build(BuildContext context) {
    // Validar las entradas de horas y minutos
    if (horas < 0 || horas > 60) {
      _showErrorDialog(context, 'Las horas deben estar entre 0 y 60.');
      return const SizedBox.shrink(); // Retorna un widget vacío si la validación falla
    }
    if (minutos < 0 || minutos > 60) {
      _showErrorDialog(context, 'Los minutos deben estar entre 0 y 60.');
      return const SizedBox.shrink(); // Retorna un widget vacío si la validación falla
    }

    // Calcular los resultados utilizando la clase Consumo
    Consumo consumo = calcularConsumo(
      km: km,
      precioLitro: precioLitro,
      dineroGastado: dineroGastado,
      horas: horas,
      minutos: minutos,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabecera con el ícono y el título
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.car_repair,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Resultados del Consumo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tarjeta para mostrar resultados
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildResultRow('Kilómetros recorridos', '${km.toStringAsFixed(2)} km'),
                    const Divider(),
                    _buildResultRow('Precio por litro de gasolina', '\$${precioLitro.toStringAsFixed(2)}'),
                    const Divider(),
                    _buildResultRow('Dinero gastado', '\$${dineroGastado.toStringAsFixed(2)}'),
                    const Divider(),
                    _buildResultRow(
                        'Consumo por kilómetro', '${consumo.litrosKm.toStringAsFixed(2)} litros/km'),
                    const Divider(),
                    _buildResultRow(
                        'Consumo por 100 km', '${consumo.litrosPor100Km.toStringAsFixed(2)} litros'),
                    const Divider(),
                    _buildResultRow(
                        'Velocidad media',
                        '${consumo.velocidadKmH.toStringAsFixed(2)} km/h '
                            '(${consumo.velocidadMS.toStringAsFixed(2)} m/s)'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Calcular nuevamente',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _showErrorDialog(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Entrada inválida'),
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
