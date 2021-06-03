import 'package:done/core/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleTask extends StatelessWidget {
  final Task task;
  SingleTask(this.task);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        task.completed ? Icons.check_circle_outline : Icons.circle_outlined,
      ),
      title: Text(task.name),
    );
  }
}
