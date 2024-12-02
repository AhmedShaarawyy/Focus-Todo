import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final String? name;
  final bool? isChecked;
  final Function(bool?)? checkBoxCallback;
  final Function()? longPressCallback;

  TasksTile({
    this.name,
    this.isChecked,
    this.checkBoxCallback,
    this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        name ?? '',
        style: TextStyle(
          decoration: (isChecked ?? false)
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.orangeAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
