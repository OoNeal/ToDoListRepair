class Task {
  final int? id;
  final String content;
  bool completed;
  final String? title;

  Task({this.id, required this.content, required this.completed, this.title});

  set setCompleted(bool value) => completed = value;
}