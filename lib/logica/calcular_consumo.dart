class Consumo {
  final double litrosKm; // Litros consumidos por kilómetro
  final double litrosPor100Km; // Litros consumidos por 100 km
  final double velocidadKmH; // Velocidad media en km/h
  final double velocidadMS; // Velocidad media en m/s

  Consumo({
    required this.litrosKm,
    required this.litrosPor100Km,
    required this.velocidadKmH,
    required this.velocidadMS,
  });

  @override
  String toString() {
    return 'Consumo: $litrosKm litros/km, $litrosPor100Km litros/100km, $velocidadKmH km/h, $velocidadMS m/s';
  }
}

Consumo calcularConsumo({
  required double km,
  required double precioLitro,
  required double dineroGastado,
  required int horas,
  required int minutos,
}) {
  // Calcular litros gastados
  double litrosGastados = dineroGastado / precioLitro;

  // Calcular consumo por kilómetro
  double litrosKm = litrosGastados / km;

  // Calcular consumo por 100 kilómetros
  double litrosPor100Km = litrosKm * 100;

  // Calcular tiempo total en horas
  double tiempoTotalHoras = horas + (minutos / 60.0);

  // Calcular velocidad media en km/h y m/s
  double velocidadKmH = km / tiempoTotalHoras;
  double velocidadMS = velocidadKmH * (1000 / 3600);

  return Consumo(
    litrosKm: litrosKm,
    litrosPor100Km: litrosPor100Km,
    velocidadKmH: velocidadKmH,
    velocidadMS: velocidadMS,
  );
}
