import 'package:flutter/material.dart';

class AgregarTarea extends StatefulWidget {
  final void Function(String) presionarAgregar;
  const AgregarTarea({
    required this.presionarAgregar,
    super.key,
  });

  @override
  State<AgregarTarea> createState() => _AgregarTareaState();
}

class _AgregarTareaState extends State<AgregarTarea> {
  final idForm = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: idForm,
      child: Column(
        children: [
          TextFormField(
            controller: textEditingController,
            validator: (value) {
              if (value?.isEmpty == true || value == null) {
                return 'Este campo no puede estar vacio';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              counterText: '${textEditingController.text.length} letra(s)',
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
              setState(() {});
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              final formularioValido = idForm.currentState?.validate() ?? false;
              if (formularioValido) {
                widget.presionarAgregar(textEditingController.text);

                textEditingController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            label: Text('Agregar'),
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
