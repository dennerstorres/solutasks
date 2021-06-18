import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solutasks/models/Tarefa.dart';
import 'package:solutasks/provider/tarefas.dart';

class TarefaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};
  TarefaForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de tarefa"),
        brightness: Brightness.dark,
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Tarefas>(context, listen: false).put(Tarefa(
                      id: _formData['id'].toString(),
                      tarefa: _formData['tarefa'].toString(),
                      status: int.parse(_formData['status'].toString()),
                      executando: false));
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Tarefa'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tarefa inválida.';
                  }

                  if (value.trim().length < 5) {
                    return 'Digite mais informações.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['tarefa'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty || int.parse(value) > 100) {
                    return 'Status inválido.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['status'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
