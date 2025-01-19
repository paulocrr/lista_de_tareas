import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AgregarTarea extends StatefulWidget {
  const AgregarTarea({
    super.key,
  });

  @override
  State<AgregarTarea> createState() => _AgregarTareaState();
}

class _AgregarTareaState extends State<AgregarTarea> {
  var textoActual = '';
  var longitudDelTexto = 0;
  final idForm = GlobalKey<FormState>();
  var itemsAMostrar = <DropdownMenuItem<int>>[];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: idForm,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (double.tryParse(value!) == null) {
                return 'No es un entero valido';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              counterText: '$longitudDelTexto letra(s)',
              border: OutlineInputBorder(),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.task),
                  Text('Tarea'),
                ],
              ),
            ),
            onChanged: (nuevoTexto) {
              setState(() {
                textoActual = nuevoTexto;
                longitudDelTexto = textoActual.length;
                if (textoActual == 'frutas') {
                  itemsAMostrar = [
                    DropdownMenuItem(value: 1, child: Text('Manzana')),
                    DropdownMenuItem(value: 2, child: Text('Pera')),
                    DropdownMenuItem(value: 3, child: Text('Uva')),
                  ];
                }
              });
            },
          ),
          DropdownButtonFormField(
            items: itemsAMostrar,
            onChanged: (nuevoNumero) {
              print(nuevoNumero);
            },
            validator: (value) {
              print(value);
              if (value == null) {
                return 'Seleccionar esto es obligatorio';
              }

              return null;
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              final formularioValido = idForm.currentState?.validate() ?? false;
            },
            label: Text('Agregar'),
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
