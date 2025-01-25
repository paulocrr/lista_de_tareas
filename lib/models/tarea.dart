class Tarea {
  final String identificador;
  final String descripcion;
  final DateTime fechaDeCreacion;
  bool terminada;

  Tarea({
    required this.identificador,
    required this.descripcion,
    required this.fechaDeCreacion,
    this.terminada = false,
  });
}
