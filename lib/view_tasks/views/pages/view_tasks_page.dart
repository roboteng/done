import 'package:done/view_tasks/views/view_tasks_view_model.dart';
import 'package:done/view_tasks/views/widgets/single_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewTasksPage extends StatelessWidget {
  final ViewTasksViewModel viewModel;
  ViewTasksPage(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: viewModel.tasks.map((task) => SingleTask(task)).toList(),
      ),
    );
  }
}
