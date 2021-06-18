class Tarefa {
  final String id;
  final String tarefa;
  final int status;
  final bool executando;

  const Tarefa(
      {this.id = '',
      required this.tarefa,
      required this.status,
      required this.executando});
}
