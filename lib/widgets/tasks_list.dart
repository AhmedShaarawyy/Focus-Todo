import 'package:flutter/material.dart';
import 'package:focus_todo/Model/tasks_controller.dart';
import 'package:focus_todo/widgets/tasks_tile.dart';
import 'package:get/get.dart';


class TasksList extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();

  TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: taskController.taskCount,
        itemBuilder: (context, index) {
          final task = taskController.tasks[index];
          return TasksTile(
            name: task.name,
            isChecked: task.isCompleted,
            checkBoxCallback: (bool? value) {
              taskController.updateTask(task);
            },
            longPressCallback: () {
              taskController.deleteTask(task);
            },
          );
        },
      ),
    );
  }
}
