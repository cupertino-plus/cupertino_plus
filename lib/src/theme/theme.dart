import 'package:cupertinew/cupertinew.dart';
import 'package:flutter/material.dart';

export 'colors.dart';
export 'theme_data.dart';

/// {@template cupertinew_theme}
/// A widget that provides theme data used by Cupertinew widgets.
///
/// TODO(@jeroen-meijer): Add documentation.
/// {@endtemplate}
class CupertinewTheme extends InheritedWidget {
  /// {@macro cupertinew_theme}
  const CupertinewTheme({
    Key? key,
    this.lightTheme = const CupertinewThemeData.light(),
    this.darkTheme = const CupertinewThemeData.dark(),
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  /// The light theme.
  ///
  /// This theme is automatically applied if the [ThemeData.brightness] of the
  /// [Theme] that is closest in the current scope to the widget using this
  /// theme is [Brightness.light].
  final CupertinewThemeData lightTheme;

  /// The dark theme.
  ///
  /// This theme is automatically applied if the [ThemeData.brightness] of the
  /// [Theme] that is closest in the current scope to the widget using this
  /// theme is [Brightness.dark].
  final CupertinewThemeData darkTheme;

  /// Looks up the nearest [CupertinewThemeData] in the given [BuildContext].
  /// Whether the [lightTheme] or [darkTheme] is returned is determined by the
  /// [ThemeData.brightness] of the [Theme] that is closest to the given
  /// [BuildContext].
  ///
  /// If no [CupertinewThemeData] can be found, this throws a [FlutterError].
  static CupertinewThemeData of(BuildContext context) {
    final data = maybeOf(context);

    if (data == null) {
      throw FlutterError(
        'CupertinoTheme called with a context '
        'that does not contain a CupertinoTheme.',
      );
    }

    return data;
  }

  /// Looks up the nearest [CupertinewThemeData] in the given [BuildContext].
  /// Whether the [lightTheme] or [darkTheme] is returned is determined by the
  /// [ThemeData.brightness] of the [Theme] that is closest to the given
  /// [BuildContext].
  ///
  /// If no [CupertinewThemeData] can be found, this returns `null`.
  static CupertinewThemeData? maybeOf(BuildContext context) {
    final cupertinewTheme =
        context.dependOnInheritedWidgetOfExactType<CupertinewTheme>();
    final theme = Theme.of(context);

    return theme.brightness == Brightness.light
        ? cupertinewTheme?.lightTheme
        : cupertinewTheme?.darkTheme;
  }

  @override
  bool updateShouldNotify(covariant CupertinewTheme oldWidget) {
    if (oldWidget.lightTheme != lightTheme) {
      return true;
    } else if (oldWidget.darkTheme != darkTheme) {
      return true;
    } else {
      return false;
    }
  }
}
