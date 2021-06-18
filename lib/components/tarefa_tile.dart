import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solutasks/models/Tarefa.dart';
import 'package:solutasks/provider/tarefas.dart';

class TarefaTile extends StatefulWidget {
  TarefaTile({Key? key, required this.tarefa}) : super(key: key);
  final Tarefa tarefa;
  @override
  _TarefaTileState createState() => _TarefaTileState();
}

class _TarefaTileState extends State<TarefaTile> {
  String input = "";

  @override
  void initState() {
    super.initState();
  }

  void _paraTarefa() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("Digite a porcentagem de conclusão da tarefa"),
            content: TextField(
              onChanged: (String tarefa) {
                input = tarefa;
              },
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<Tarefas>(context, listen: false).put(Tarefa(
                        id: widget.tarefa.id,
                        tarefa: widget.tarefa.tarefa,
                        status: int.parse(input),
                        executando: false
                      ));
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text("Parar tarefa"))
            ],
          );
        });
  }

  void _iniciatarefa() {
    setState(() {
      Provider.of<Tarefas>(context, listen: false).put(Tarefa(
        id: widget.tarefa.id,
        tarefa: widget.tarefa.tarefa,
        status: widget.tarefa.status,
        executando: true
      ));
    });  
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.task),
      ),
      title: Text(widget.tarefa.tarefa),
      subtitle: Text(widget.tarefa.status.toString() + ' %' + (widget.tarefa.executando ? '     executando...' : '')),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              disabledColor: Colors.grey,
              onPressed: widget.tarefa.executando ? () {_paraTarefa();} : null,
              icon: Icon(Icons.stop),
              color: Colors.purple,
            ),
            IconButton(
              disabledColor: Colors.grey,
              onPressed: widget.tarefa.executando ? null : () {_iniciatarefa();},
              icon: Icon(Icons.play_arrow),
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
