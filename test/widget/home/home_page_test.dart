import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/home/pages/home_page.dart';

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
  });
}
