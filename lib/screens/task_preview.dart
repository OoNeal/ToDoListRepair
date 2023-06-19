import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({super.key, required this.task});

  final Task task;

  @override
  _TaskPreviewState createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title!),
      subtitle: Text(widget.task.content),
      leading: Checkbox(
        value: widget.task.completed,
        onChanged: (value) {
          setState(() {
            widget.task.completed = value!;
          });
        },
      ),
    );
  }
}
