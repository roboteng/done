import 'package:done/core/domain/entities/completed_task.dart';
import 'package:done/core/domain/entities/task.dart';
import 'package:done/core/domain/entities/uncompleted_task.dart';
import 'package:done/view_tasks/views/widgets/single_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/skeleton_app.dart';

class TestCase {
  final String desc;
  final Task task;
  final Finder finder;
  final Matcher expectation;

  TestCase(this.desc, this.task, this.finder, this.expectation);
}

void main() {
  group("Single Task view", () {
    final String taskName = "Task Name";
    for (TestCase testCase in [
      TestCase(
        "should show the name of the task",
        UncompletedTask(taskName),
        find.text(taskName),
        findsOneWidget,
      ),
      TestCase(
        "should have an circle indicator for not completed task",
        UncompletedTask(taskName),
        find.byIcon(Icons.circle_outlined),
        findsOneWidget,
      ),
      TestCase(
        "should not have an circle indicator for completed task",
        CompletedTask(taskName),
        find.byIcon(Icons.circle_outlined),
        findsNothing,
      ),
      TestCase(
        "should not have an circle indicator for completed task",
        CompletedTask(taskName),
        find.byIcon(Icons.check_circle_outline),
        findsOneWidget,
      ),
    ]) {
      testWidgets("${testCase.desc}", (tester) async {
        // arrange
        final widget = SingleTask(testCase.task);
        await tester.pumpWidget(skeletonApp(widget));

        // act
        final finder = testCase.finder;

        // assert
        expect(finder, testCase.expectation);
      });
    }
  });
}
