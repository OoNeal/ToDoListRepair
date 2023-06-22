import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_v1/providers/tasks_provider.dart';
import 'package:todo_list_v1/screens/task_form.dart';
import '../models/task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, _) {
        return ListTile(
          title: Text(task.title!),
          subtitle: Text(task.content),
          leading: Checkbox(
            value: task.completed,
            onChanged: (value) {
            tasksProvider.toggleTask(task);
            },
          ),
          onTap: () async {
            Task? updatedTask = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TaskForm(task: task)),
            );
            if (updatedTask != null) {
              tasksProvider.updateTask(updatedTask);
            }
          },
        );
      },
    );
  }
}
