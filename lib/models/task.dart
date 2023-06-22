class Task {
  int? id;
  String content;
  bool completed;
  String? title;

  Task({this.id, required this.content, required this.completed, this.title});

  set setCompleted(bool value) => completed = value;

  get getTitle => title;
  set setTitle(String value) => title = value;

  get getContent => content;
  set setContent(String value) => content = value;

  set setId(int value) => id = value;

  static fromJson(task) {
    return Task(
      id: task['id'],
      content: task['content'],
      completed: task['completed'],
      title: task['title'],
    );
  }

  toJson() {
    return {
      'id': id,
      'content': content,
      'completed': completed,
      'title': title,
    };
  }
}