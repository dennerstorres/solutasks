import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solutasks/provider/tarefas.dart';
import 'package:solutasks/routes/app_routes.dart';
import 'package:solutasks/views/gera_senha.dart';
import 'package:solutasks/views/tarefa_form.dart';
import 'package:solutasks/views/tarefa_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Tarefas(),
        ),
      ],
      child: MaterialApp(
        title: 'Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (_) => TarefaLista(),
          AppRoutes.TAREFA_FORM: (_) => TarefaForm(),
          AppRoutes.GERA_SENHA: (_) => GeraSenha()
        },
      ),
    );
  }
}
