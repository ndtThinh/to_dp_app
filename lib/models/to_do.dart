class ToDo {
  int? id;
  String? title;
  bool? done;

  ToDo(this.id, this.title, this.done) {}

  static List<ToDo> todoList() {
    return [
      ToDo(1, 'Do homework', true),
      ToDo(2, 'Play soccer', true),
      ToDo(3, 'Clean house', false),
      ToDo(4, 'Meet friend', false)
    ];
  }
}
