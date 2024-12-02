import 'package:flutter/material.dart';
import 'package:focus_todo/screens/tasks_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    );
  }
}