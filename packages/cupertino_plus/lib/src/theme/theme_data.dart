import 'dart:ui';

import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:flutter/foundation.dart';

// ignore_for_file: cascade_invocations

/// {@template cupertino_plus_theme_data}
/// Defines the configuration of the overall visual `StreamFeedTheme` for a
/// particular widget subtree.
/// {@endtemplate}
class CupertinoPlusThemeData with Diagnosticable {
  /// {@macro cupertino_plus_theme_data}
  ///
  /// Builds a `CupertinoPlusThemeData` with default values, if none are given.
  factory CupertinoPlusThemeData({
    CupertinoPlusColors? colors,
    Brightness? brightness,
  }) {
    // Use `Brightness.light` as default if none is given
    brightness ??= Brightness.light;
    final isDark = brightness == Brightness.dark;

    // Use `CupertinoPlusColors.dark()` or` CupertinoPlusColors.light()`
    // as default, depending on the value of `brightness`.
    colors ??= isDark
        ? const CupertinoPlusColors.dark()
        : const CupertinoPlusColors.light();

    return CupertinoPlusThemeData.raw(
      colors: colors,
      brightness: brightness,
    );
  }

  /// The default theme for light-themed Cupertino Plus widgets.
  factory CupertinoPlusThemeData.light() => CupertinoPlusThemeData(
    colors: const CupertinoPlusColors.light(),
    brightness: Brightness.light,
  );

  /// The default theme for dark-themed Cupertino Plus widgets.
  factory CupertinoPlusThemeData.dark() => CupertinoPlusThemeData(
    colors: const CupertinoPlusColors.dark(),
    brightness: Brightness.dark,
  );

  /// Raw `CupertinoPlusThemeData` initialization.
  const CupertinoPlusThemeData.raw({
    required this.colors,
    required this.brightness,
  });

  /// The colors used to style descendant Cupertino Plus widgets.
  final CupertinoPlusColors colors;

  /// The `brightness` of this theme.
  final Brightness brightness;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CupertinoPlusColors>('colors', colors));
    properties.add(EnumProperty<Brightness>('brightness', brightness));
  }
}
