import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/task.dart';

class TasksProvider extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  Future<List<Task>> getTasks() async {
    final response = await supabase.from('tasks').select();
    List<Task> tasks = [];
    for (var task in response) {
      tasks.add(Task.fromJson(task) as Task);
    }
    return tasks;
  }

  Future<Task> getTask(int id) async {
    final response =
        await supabase.from('tasks').select().eq('id', id).single();
    final task = Task.fromJson(response);
    return task;
  }

  Future<void> addTask(Task task) async {
    await supabase.from('tasks').insert(task.toJson());
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await supabase
        .from('tasks')
        .update(task.toJson())
        .match({'id': task.id});
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async{
    await supabase.from('tasks').delete().match({'id': task.id});
    notifyListeners();
  }

  Future<void> toggleTask(Task task) async {
    await supabase
        .from('tasks')
        .update({'completed': !task.completed})
        .match({'id': task.id});
    notifyListeners();
  }
}
