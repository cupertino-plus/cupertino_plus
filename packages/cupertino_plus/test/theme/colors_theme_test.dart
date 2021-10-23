import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CupertinoPlusColors.light() copyWith, ==, hashCode basics', () {
    expect(const CupertinoPlusColors.light(),
        const CupertinoPlusColors.light().copyWith());
    expect(const CupertinoPlusColors.light().hashCode,
        const CupertinoPlusColors.light().copyWith().hashCode);
  });

  test('CupertinoPlusColors.dark() copyWith, ==, hashCode basics', () {
    expect(const CupertinoPlusColors.dark(),
        const CupertinoPlusColors.dark().copyWith());
    expect(const CupertinoPlusColors.dark().hashCode,
        const CupertinoPlusColors.dark().copyWith().hashCode);
  });

  testWidgets('Default theme values', (tester) async {
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

    final colors = CupertinoPlusColors.of(capturedContext);
    expect(colors.brightness, Brightness.light);
    expect(colors.systemBlue, CupertinoPlusThemeData.light().colors.systemBlue);
    expect(
        colors.systemBrown, CupertinoPlusThemeData.light().colors.systemBrown);
    expect(colors.systemCyan, CupertinoPlusThemeData.light().colors.systemCyan);
    expect(colors.systemGray, CupertinoPlusThemeData.light().colors.systemGray);
    expect(
        colors.systemGray2, CupertinoPlusThemeData.light().colors.systemGray2);
    expect(
        colors.systemGray3, CupertinoPlusThemeData.light().colors.systemGray3);
    expect(
        colors.systemGray4, CupertinoPlusThemeData.light().colors.systemGray4);
    expect(
        colors.systemGray5, CupertinoPlusThemeData.light().colors.systemGray5);
    expect(
        colors.systemGray6, CupertinoPlusThemeData.light().colors.systemGray6);
    expect(
        colors.systemGreen, CupertinoPlusThemeData.light().colors.systemGreen);
    expect(colors.systemIndigo,
        CupertinoPlusThemeData.light().colors.systemIndigo);
    expect(colors.systemMint, CupertinoPlusThemeData.light().colors.systemMint);
    expect(colors.systemOrange,
        CupertinoPlusThemeData.light().colors.systemOrange);
    expect(colors.systemPink, CupertinoPlusThemeData.light().colors.systemPink);
    expect(colors.systemPurple,
        CupertinoPlusThemeData.light().colors.systemPurple);
    expect(colors.systemRed, CupertinoPlusThemeData.light().colors.systemRed);
    expect(colors.systemTeal, CupertinoPlusThemeData.light().colors.systemTeal);
    expect(colors.systemYellow,
        CupertinoPlusThemeData.light().colors.systemYellow);
  });
}
