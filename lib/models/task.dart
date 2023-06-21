class Task {
  final int? id;
  String content;
  bool completed;
  String? title;

  Task({this.id, required this.content, required this.completed, this.title});

  set setCompleted(bool value) => completed = value;

  get getTitle => title;
  set setTitle(String value) => title = value;

  get getContent => content;
  set setContent(String value) => content = value;
}