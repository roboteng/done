import 'package:done/core/domain/entities/completed_task.dart';
import 'package:done/view_tasks/views/pages/view_tasks_page.dart';
import 'package:done/view_tasks/views/view_tasks_view_model.dart';
import 'package:done/view_tasks/views/widgets/single_task.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/skeleton_app.dart';

void main() {
  group("View Tasks page", () {
    testWidgets("should display 0 tasks", (tester) async {
      // arrange
      final page = ViewTasksPage(ViewTasksViewModel());
      await tester.pumpWidget(skeletonApp(page));

      // act
      final widgets = find.byType(SingleTask);

      // assert
      expect(widgets, findsNothing);
    });

    testWidgets("should show a competed task if the viewmodel contains it",
        (tester) async {
      // arrange
      final taskName = "Task Name";
      final viewModel = ViewTasksViewModel();
      final page = ViewTasksPage(viewModel);
      viewModel.tasks = [CompletedTask(taskName)];
      await tester.pumpWidget(skeletonApp(page));

      // act
      final completed = find.byWidgetPredicate((widget) {
        if (!(widget is SingleTask)) return false;
        if (!(widget.task is CompletedTask)) return false;
        return widget.task.name == taskName;
      });

      // assert
      expect(completed, findsOneWidget);
    });
  });
}
