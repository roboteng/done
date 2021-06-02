import 'package:done/add_task/add_task_view_model.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  final AddTaskViewModel viewModel;
  AddTaskPage(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          key: ValueKey("addTask"),
          onChanged: (newName) {
            viewModel.taskName = newName;
          },
        ),
        OutlinedButton(onPressed: viewModel.onCancel, child: Text("Cancel")),
        ElevatedButton(onPressed: viewModel.onSave, child: Text("Save")),
      ],
    );
  }
}
