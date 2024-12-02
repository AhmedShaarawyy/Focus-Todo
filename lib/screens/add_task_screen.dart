import 'package:flutter/material.dart';
import 'package:focus_todo/Model/tasks_controller.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();
  final TextEditingController textController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent),
              ),
            ),
            controller: textController,
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.orangeAccent,
            onPressed: () {
              taskController.addTask(textController.text);
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
