import 'package:flutter/material.dart';
import 'package:todo_list_v1/screens/task_form.dart';

import '../models/task.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview(
      {super.key, required this.task, required this.onTaskUpdated});

  final Task task;
  final Function(Task) onTaskUpdated;

  @override
  _TaskPreviewState createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  final taskNotifier = ValueNotifier<Task?>(null);

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
      onTap: () async {
        Task updatedTask = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TaskForm(task: widget.task);
        }));
        widget.onTaskUpdated(updatedTask);

      },
    );
  }
}
