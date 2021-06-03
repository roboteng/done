import 'package:done/core/domain/entities/task.dart';
import 'package:flutter/material.dart';

class UncompletedTask extends Task {
  UncompletedTask(String name) : super(name);

  @override
  IconData get icon => Icons.circle_outlined;
}
