import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:flutter/foundation.dart';
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

    testWidgets('default CupertinoPlusThemeData debugFillProperties',
        (tester) async {
      final builder = DiagnosticPropertiesBuilder();
      const CupertinoPlusThemeData.raw(
        colors: CupertinoPlusColors.light(),
        brightness: Brightness.light,
      ).debugFillProperties(builder);

      final description = builder.properties
          .where((node) => !node.isFiltered(DiagnosticLevel.info))
          .map((node) => node.toString())
          .toList();

      expect(
        description,
        <String>[
          '''colors: CupertinoPlusColors(Brightness.light, Color(0xffff3b30), Color(0xffff9500), Color(0xffffcc00), Color(0xff34c759), Color(0xff00c7be), Color(0xff30b0c7), Color(0xff32ade6), Color(0xff007aff), Color(0xff5856d6), Color(0xffaf52de), Color(0xffff2d55), Color(0xffa2845e), Color(0xff8e8e93), Color(0xffaeaeb2), Color(0xffc7c7cc), Color(0xffd1d1d6), Color(0xffe5e5ea), Color(0xfff2f2f7))''',
          'brightness: light'
        ],
      );
    });
  });
}
