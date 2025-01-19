import 'package:flutter/material.dart';
import 'package:lista_de_tareas/ui/agregar_tarea.dart';
import 'package:lista_de_tareas/ui/item_de_tarea.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            AgregarTarea(),
            Expanded(
              child: ListView(
                children: [ItemDeTarea()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
