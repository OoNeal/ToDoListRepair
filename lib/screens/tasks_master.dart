import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_v1/models/task.dart';
import 'package:todo_list_v1/screens/task_preview.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({Key? key}) : super(key: key);

  @override
  _TasksMasterState createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      FutureBuilder(
          future: _fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Task> tasks = snapshot.data as List<Task>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskPreview(task: tasks[index]);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })
    ]);
  }

  List<Task> _tasks = [];

//create function _fetchTasks
  Future<List<Task>> _fetchTasks() {
    if (_tasks.isEmpty) {
      var faker = new Faker();
      for (var i = 0; i < 100; i++) {
        _tasks.add(Task(
          id: i,
          content: faker.lorem.sentence(),
          completed: faker.randomGenerator.boolean(),
          title: faker.lorem.word(),
        ));
      }
    }
    return Future<List<Task>>.delayed(
      const Duration(seconds: 4),
      () => Future<List<Task>>.value(_tasks),
    );
  }
}
