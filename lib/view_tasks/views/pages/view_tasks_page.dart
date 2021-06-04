import 'package:done/core/domain/entities/task.dart';
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
      body: StreamBuilder<List<Task>>(
          stream: viewModel.tasksStream,
          builder: (context, snapshot) {
            return Column(
              children:
                  snapshot.data?.map((task) => SingleTask(task)).toList() ?? [],
            );
          }),
    );
  }
}
