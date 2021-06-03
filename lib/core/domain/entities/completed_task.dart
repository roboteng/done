import 'package:done/core/domain/entities/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedTask extends Task {
  CompletedTask(String name) : super(name);

  @override
  IconData get icon => Icons.check_circle_outline;
}
