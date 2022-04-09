import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/home/pages/home_page.dart';
import 'package:todo_win/presentation/shared/widgets/alert/alert_collection.dart';
import 'package:todo_win/presentation/shared/widgets/loading/loading.dart';

void main() {
  group('Home Page Test', () {
    testWidgets('should build without exploding', (WidgetTester tester) async {
      setupDependencies();
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      sl.reset();
    });

    testWidgets('find text from home page', (WidgetTester tester) async {
      setupDependencies();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Nova Lista'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
      expect(
          find.widgetWithIcon(IconButton, Icons.info_outline), findsOneWidget);
      expect(find.byType(Loading), findsOneWidget);
      sl.reset();
    });

    testWidgets('click button new list', (WidgetTester tester) async {
      setupDependencies();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(AlertCollection), findsOneWidget);
      expect(find.widgetWithText(AlertCollection, 'Registrar data'),
          findsOneWidget);
    });
    sl.reset();
  });
}
