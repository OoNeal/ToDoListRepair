import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskForm extends StatefulWidget {
  TaskForm({Key? key, this.task}) : super(key: key);

  final Task? task;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      widget._titleController.text = widget.task!.title!;
      widget._contentController.text = widget.task!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Form'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: widget._titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              controller: widget._contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
            Visibility(
              visible: widget.task != null,
              child: Checkbox(
                tristate: false,
                value: widget.task?.completed ?? false,
                onChanged: (value) {
                  setState(() {
                    widget.task?.completed = value!;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Task task = Task(
                  id: widget.task?.id ?? -1,
                  title: widget._titleController.text,
                  content: widget._contentController.text,
                  completed: widget.task?.completed ?? false,
                );
                Navigator.of(context).pop(task);
                print(task.id);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
