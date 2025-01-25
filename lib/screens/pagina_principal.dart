import 'package:flutter/material.dart';
import 'package:lista_de_tareas/models/tarea.dart';
import 'package:lista_de_tareas/ui/agregar_tarea.dart';
import 'package:lista_de_tareas/ui/item_de_tarea.dart';
import 'package:uuid/uuid.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({
    super.key,
  });

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final listaDeTareas = <Tarea>[];

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
            AgregarTarea(
              presionarAgregar: (descripcionTarea) {
                setState(() {
                  final identificador = Uuid().v4();
                  listaDeTareas.add(
                    Tarea(
                      identificador: identificador,
                      descripcion: descripcionTarea,
                      fechaDeCreacion: DateTime.now(),
                    ),
                  );
                });
              },
            ),
            Expanded(
              child: ReorderableListView(
                onReorderStart: (oldIndex) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex = newIndex - 1;
                    }
                    final tareaRemovida = listaDeTareas.removeAt(oldIndex);
                    listaDeTareas.insert(newIndex, tareaRemovida);
                  });
                },
                children: listaDeTareas.map((tarea) {
                  return ItemDeTarea(
                    key: Key(tarea.identificador),
                    tarea: tarea,
                    alBorrar: (tareaActual) {
                      setState(() {
                        listaDeTareas.removeWhere((tarea) {
                          return tarea.identificador ==
                              tareaActual.identificador;
                        });
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
