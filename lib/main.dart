import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'todo_list_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://ygoeyfvuuwxtjibqczym.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlnb2V5ZnZ1dXd4dGppYnFjenltIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYyOTIwNTAsImV4cCI6MjAwMTg2ODA1MH0.fdReNCjDGLrgC1et3uWY7IPx-4IOYhEmB0ratmMUHhY",
  );
  runApp(const ToDoListApp());
}
