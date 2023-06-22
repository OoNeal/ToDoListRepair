import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_v1/models/task.dart';
import 'package:todo_list_v1/screens/task_form.dart';
import 'package:todo_list_v1/screens/task_preview.dart';

import '../providers/tasks_provider.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({Key? key}) : super(key: key);

  @override
  _TasksMasterState createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, _) {
        return ListView(children: [
          FutureBuilder(
              future: Provider.of<TasksProvider>(context).getTasks(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  tasks = snapshot.data!;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () async {
                            Task newTask = await Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => TaskForm()),
                            );
                            newTask.id = tasks.last.id! + 1;
                            tasksProvider.addTask(newTask);
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                      for (var task in tasks) TaskPreview(task: task),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ]);
      },
    );
  }
}
