import 'package:done/add_task/views/pages/add_task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Add Tasks", () {
    testWidgets("should be able to enter text into text field", (tester) async {
      // arrange
      final page = AddTaskPage();

      // act
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: page)));
      final tv = find.byKey(ValueKey("addTask"));
      await tester.enterText(tv, "my task");
      await tester.pump();

      // assert
      expect(tv, findsOneWidget);
      expect(find.text("my task"), findsOneWidget);
    });
  });
}
