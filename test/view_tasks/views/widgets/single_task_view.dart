import 'package:done/view_tasks/views/widgets/single_task.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/skeleton_app.dart';

void main() {
  group("Single Task view", () {
    testWidgets("should show the name of the task", (tester) async {
      // arrange
      final taskName = "task name";
      final view = SingleTask(taskName);
      await tester.pumpWidget(skeletonApp(view));

      // act
      final text = find.text(taskName);

      // assert
      expect(text, findsOneWidget);
    });
  });
}
