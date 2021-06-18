import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solutasks/components/tarefa_tile.dart';
import 'package:solutasks/provider/tarefas.dart';
import 'package:solutasks/routes/app_routes.dart';

class TarefaLista extends StatelessWidget {
  const TarefaLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Tarefas tarefas = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        brightness: Brightness.dark,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.GERA_SENHA);
            },
            icon: Icon(Icons.vpn_key),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tarefas.count,
        itemBuilder: (ctx, i) => TarefaTile(
          tarefa: tarefas.byIndex(i),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.TAREFA_FORM);
        },
        tooltip: 'Adicionar tarefa',
        child: Icon(Icons.add),
      ),
    );
  }
}
