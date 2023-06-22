import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_v1/screens/tasks_master.dart';
import 'package:todo_list_v1/providers/tasks_provider.dart';

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({Key? key}) : super(key: key);

  @override
  State<ToDoListApp> createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo List',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ToDo List'),
          ),
          body: ChangeNotifierProvider(
            create: (context) => TasksProvider(),
            child: const TasksMaster(),
          ),
        ));
  }
}
