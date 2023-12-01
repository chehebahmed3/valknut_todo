class TodoData {
  String? id;
  String? text;
  bool done;

  TodoData({
    required this.id,
    required this.text,
    this.done = false,
  });
  static List<TodoData> todoList() {
    return [];
  }
}
