import 'package:done/core/task.dart';
import 'package:done/view_tasks/views/widgets/single_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/skeleton_app.dart';

void main() {
  group("Single Task view", () {
    testWidgets("should show the name of the task", (tester) async {
      // arrange
      final taskName = "task name";
      final task = Task(taskName, false);
      final view = SingleTask(task);
      await tester.pumpWidget(skeletonApp(view));

      // act
      final text = find.text(taskName);

      // assert
      expect(text, findsOneWidget);
    });

    testWidgets("should have an circle indicator for not completed task",
        (tester) async {
      // arrange
      final task = Task("task name", false);
      final widget = SingleTask(task);
      await tester.pumpWidget(skeletonApp(widget));

      // act
      final icon = find.byIcon(Icons.circle_outlined);

      // assert
      expect(icon, findsOneWidget);
    });

    testWidgets("should not have an circle indicator for completed task",
        (tester) async {
      // arrange
      final task = Task("task name", true);
      final widget = SingleTask(task);
      await tester.pumpWidget(skeletonApp(widget));

      // act
      final icon = find.byIcon(Icons.circle_outlined);

      // assert
      expect(icon, findsNothing);
    });

    testWidgets("should have an check indicator for completed task",
        (tester) async {
      // arrange
      final task = Task("task name", true);
      final widget = SingleTask(task);
      await tester.pumpWidget(skeletonApp(widget));

      // act
      final icon = find.byIcon(Icons.check_circle_outline);

      // assert
      expect(icon, findsOneWidget);
    });
  });
}
