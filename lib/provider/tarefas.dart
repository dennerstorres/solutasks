import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solutasks/data/dummy_tarefas.dart';
import 'package:solutasks/models/Tarefa.dart';

class Tarefas with ChangeNotifier {
  final Map<String, Tarefa> _items = {...DUMMY_TAREFAS};

  List<Tarefa> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Tarefa byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Tarefa tarefa) {
    if (tarefa == null) {
      return;
    }

    if (tarefa.id.trim().isNotEmpty && _items.containsKey(tarefa.id)) {
      //alterar
      _items.update(
          tarefa.id,
          (_) => Tarefa(
              id: tarefa.id,
              tarefa: tarefa.tarefa,
              status: tarefa.status,
              executando: tarefa.executando));
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Tarefa(
              id: id,
              tarefa: tarefa.tarefa,
              status: tarefa.status,
              executando: tarefa.executando));
    }

    notifyListeners();
  }

  void remove(Tarefa tarefa) {
    _items.remove(tarefa.id);

    notifyListeners();
  }
}
