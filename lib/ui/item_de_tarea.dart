import 'package:flutter/material.dart';

class ItemDeTarea extends StatefulWidget {
  const ItemDeTarea({
    super.key,
  });

  @override
  State<ItemDeTarea> createState() => _ItemDeTareaState();
}

class _ItemDeTareaState extends State<ItemDeTarea> {
  var estaMarcado = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: estaMarcado,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              estaMarcado = value ?? false;
            });
          },
        ),
        title: Text(
          'Tarea 1',
          style: TextStyle(
            decoration: estaMarcado == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: Colors.blue,
          ),
        ),
        subtitle: Text('19/01/2025'),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
