import 'package:flutter/widgets.dart';

class SingleTask extends StatelessWidget {
  final String taskName;
  SingleTask(this.taskName);

  @override
  Widget build(BuildContext context) {
    return Text(taskName);
  }
}
