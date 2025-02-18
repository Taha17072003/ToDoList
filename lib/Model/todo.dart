class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '1', todoText: 'Internship Task#1', ),
      ToDo(id: '2', todoText: 'Internship Task#2', ),
      ToDo(id: '3', todoText: 'Grader Task', ),
      ToDo(id: '4', todoText: 'Is Videos', isDone: true),
      ToDo(id: '5', todoText: 'PS Videos', isDone: true),
    ];
  }
}