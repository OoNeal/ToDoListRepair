import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_v1/models/task.dart';
import 'package:todo_list_v1/screens/task_form.dart';
import 'package:todo_list_v1/screens/task_preview.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({Key? key}) : super(key: key);

  @override
  _TasksMasterState createState() => _TasksMasterState();
}

List<Task> tasks = [];

class _TasksMasterState extends State<TasksMaster> {

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      FutureBuilder(
          future: _fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              tasks = snapshot.data as List<Task>;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () async {
                        Task updatedTask = await Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TaskForm();
                        }));
                        setState(() {
                          tasks.add(updatedTask);
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                  for (var task in tasks)
                    TaskPreview(
                      task: task,
                      onTaskUpdated: onTaskUpdated,
                    ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    ]);
  }

  void onTaskUpdated(Task updatedTask) {
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      setState(() {
        tasks[index] = updatedTask;
      });
    }
  }

  Future<List<Task>> _fetchTasks() {
    if (tasks.isNotEmpty) {
      return Future<List<Task>>.value(tasks);
    }
    for (var i = 0; i < 2; i++) {
      tasks.add(Task(
        id: i,
        content: faker.lorem.sentence(),
        completed: faker.randomGenerator.boolean(),
        title: faker.lorem.word(),
      ));
    }
    return Future<List<Task>>.delayed(
      const Duration(seconds: 4),
      () => Future<List<Task>>.value(tasks),
    );
  }
}
