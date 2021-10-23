import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:flutter/material.dart';

export 'colors.dart';
export 'theme_data.dart';

/// {@template cupertino_plus_theme}
/// Applies a [CupertinoPlusThemeData] to descendant Cupertino Plus widgets.
/// {@endtemplate}
class CupertinoPlusTheme extends InheritedWidget {
  /// {@macro cupertino_plus_theme}
  const CupertinoPlusTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// The `CupertinoThemeData` styling for this theme.
  final CupertinoPlusThemeData data;

  /// Retrieves the [CupertinoPlusThemeData] from the closest ancestor
  /// [CupertinoPlusTheme] widget.
  ///
  /// Usage:
  /// ```dart
  /// final theme = CupertinoPlusTheme.of(context);
  /// ```
  static CupertinoPlusThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<CupertinoPlusTheme>();

    assert(
      theme != null,
      '''You must have a CupertinoPlusTheme widget at the top of your widget tree''',
    );

    return theme!.data;
  }

  @override
  bool updateShouldNotify(CupertinoPlusTheme old) => data != old.data;
}
