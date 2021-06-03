import 'package:done/core/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleTask extends StatelessWidget {
  final Task task;
  SingleTask(this.task);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(task.icon),
      title: Text(task.name),
    );
  }
}
