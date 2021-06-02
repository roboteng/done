import 'package:done/add_task/add_task_view_model.dart';
import 'package:done/add_task/views/pages/add_task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget sampleApp(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group("Add Tasks", () {
    testWidgets("should be able to enter text into text field", (tester) async {
      // arrange
      final viewModel = AddTaskViewModel(() {}, () {});
      final page = AddTaskPage(viewModel);

      // act
      await tester.pumpWidget(sampleApp(page));
      final tv = find.byKey(ValueKey("addTask"));
      await tester.enterText(tv, "my task");
      await tester.pump();

      // assert
      expect(tv, findsOneWidget);
      expect(find.text("my task"), findsOneWidget);
      expect(viewModel.taskName, "my task");
    });

    for (var action in ["Cancel", "Save"]) {
      testWidgets("pressing $action should call the on$action function",
          (tester) async {
        // arrange
        var pressed = false;
        final viewModel = AddTaskViewModel(
          () => pressed = action == "Cancel",
          () => pressed = action == "Save",
        );
        final page = AddTaskPage(viewModel);

        // act
        await tester.pumpWidget(sampleApp(page));
        final actionBtn = find.bySemanticsLabel(action);
        await tester.tap(actionBtn);

        // assert
        expect(pressed, true);
      });
    }
  });
}
