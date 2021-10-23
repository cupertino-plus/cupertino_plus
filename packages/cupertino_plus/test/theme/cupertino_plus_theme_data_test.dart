import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CupertinoPlusThemeData tests', () {
    testWidgets('Default light theme has Brightness.light', (tester) async {
      late BuildContext capturedContext;
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) {
            return CupertinoPlusTheme(
              data: CupertinoPlusThemeData.light(),
              child: child!,
            );
          },
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      final theme = CupertinoPlusTheme.of(capturedContext);
      expect(theme.brightness, Brightness.light);
    });

    testWidgets('Default dark theme has Brightness.dark', (tester) async {
      late BuildContext capturedContext;
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) {
            return CupertinoPlusTheme(
              data: CupertinoPlusThemeData.dark(),
              child: child!,
            );
          },
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      final theme = CupertinoPlusTheme.of(capturedContext);
      expect(theme.brightness, Brightness.dark);
    });
  });
}
