import 'package:flutter/cupertino.dart';

class AddTaskViewModel {
  final VoidCallback onCancel;
  final VoidCallback onSave;

  String taskName;

  AddTaskViewModel(this.onCancel, this.onSave);
}
