import 'package:flutter/widgets.dart';

abstract class Task {
  final String name;
  Task(this.name);

  IconData get icon;
}
