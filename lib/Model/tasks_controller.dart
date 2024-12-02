import 'package:focus_todo/Model/task.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  int get taskCount => tasks.length;

  @override
  void onInit() {
    super.onInit();
    loadTasks(); 
  }

  void addTask(String taskName) {
    tasks.add(Task(name: taskName));
    saveTasks(); 
  }

  void updateTask(Task task) {
    task.toggleDone();
    tasks.refresh();
    saveTasks(); 
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    saveTasks(); 
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = jsonEncode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', tasksJson);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      try {
        final tasksJson = jsonDecode(tasksString) as List;
        tasks.assignAll(tasksJson.map((json) => Task.fromJson(json)).toList());
      } catch (e) {
        print('Error loading tasks: $e'); //testing
      }
    }
  }
}
