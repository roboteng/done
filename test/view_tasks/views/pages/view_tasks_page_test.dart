import 'package:done/view_tasks/views/pages/view_tasks_page.dart';
import 'package:done/view_tasks/views/widgets/single_task.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/skeleton_app.dart';

void main() {
  group("View Tasks", () {
    testWidgets("should display 0 tasks", (tester) async {
      // arrange
      final page = ViewTasksPage([]);
      await tester.pumpWidget(skeletonApp(page));

      // act
      final widgets = find.byType(SingleTask);

      // assert
      expect(widgets, findsNothing);
    });
  });
}
