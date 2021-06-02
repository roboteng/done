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

    testWidgets("pressing cancel should call the onCancel function",
        (tester) async {
      var pressed = false;

      final viewModel = AddTaskViewModel(() => pressed = true, () {});
      final page = AddTaskPage(viewModel);

      await tester.pumpWidget(sampleApp(page));
      final cancelBtn = find.bySemanticsLabel("Cancel");

      await tester.tap(cancelBtn);
      expect(pressed, true);
    });

    testWidgets("pressing save should call the onSave function",
        (tester) async {
      var pressed = false;

      final viewModel = AddTaskViewModel(() {}, () => pressed = true);
      final page = AddTaskPage(viewModel);

      await tester.pumpWidget(sampleApp(page));
      final saveBtn = find.bySemanticsLabel("Save");

      await tester.tap(saveBtn);
      expect(pressed, true);
    });
  });
}
