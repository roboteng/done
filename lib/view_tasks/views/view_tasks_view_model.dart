import 'dart:async';

import 'package:done/core/domain/entities/task.dart';

class ViewTasksViewModel {
  final StreamController<List<Task>> _tasks = StreamController();

  Stream<List<Task>> get tasksStream => _tasks.stream;
  set tasks(List<Task> tasks) {
    _tasks.sink.add(tasks);
  }

  void dispose() {
    _tasks.close();
  }
}
