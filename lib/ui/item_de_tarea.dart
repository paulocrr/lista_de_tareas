import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_tareas/models/tarea.dart';

class ItemDeTarea extends StatefulWidget {
  final Tarea tarea;
  final void Function(Tarea) alBorrar;

  const ItemDeTarea({
    required this.tarea,
    required this.alBorrar,
    super.key,
  });

  @override
  State<ItemDeTarea> createState() => _ItemDeTareaState();
}

class _ItemDeTareaState extends State<ItemDeTarea> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: widget.tarea.terminada,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              widget.tarea.terminada = value ?? false;
            });
          },
        ),
        title: Text(
          widget.tarea.descripcion,
          style: TextStyle(
            decoration: widget.tarea.terminada == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: Colors.blue,
          ),
        ),
        subtitle:
            Text(DateFormat('d MMMM,y').format(widget.tarea.fechaDeCreacion)),
        trailing: IconButton(
          onPressed: () {
            widget.alBorrar(widget.tarea);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
