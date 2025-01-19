import 'package:flutter/material.dart';
import 'package:lista_de_tareas/screens/pagina_principal.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaPrincipal(),
    );
  }
}
