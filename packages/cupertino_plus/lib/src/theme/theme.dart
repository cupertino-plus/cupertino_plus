import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:flutter/material.dart';

export 'colors.dart';
export 'theme_data.dart';

/// {@template cupertino_plus_theme}
/// A widget that provides theme data used by Cupertino Plus widgets.
///
/// TODO(@jeroen-meijer): Add documentation.
/// {@endtemplate}
class CupertinoPlusTheme extends InheritedWidget {
  /// {@macro cupertino_plus_theme}
  const CupertinoPlusTheme({
    Key? key,
    this.lightTheme = const CupertinoPlusThemeData.light(),
    this.darkTheme = const CupertinoPlusThemeData.dark(),
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
  final CupertinoPlusThemeData lightTheme;

  /// The dark theme.
  ///
  /// This theme is automatically applied if the [ThemeData.brightness] of the
  /// [Theme] that is closest in the current scope to the widget using this
  /// theme is [Brightness.dark].
  final CupertinoPlusThemeData darkTheme;

  /// Looks up the nearest [CupertinoPlusThemeData] in the given [BuildContext].
  /// Whether the [lightTheme] or [darkTheme] is returned is determined by the
  /// [ThemeData.brightness] of the [Theme] that is closest to the given
  /// [BuildContext].
  ///
  /// If no [CupertinoPlusThemeData] can be found, this throws a [FlutterError].
  static CupertinoPlusThemeData of(BuildContext context) {
    final data = maybeOf(context);

    if (data == null) {
      throw FlutterError(
        'CupertinoTheme called with a context '
        'that does not contain a CupertinoTheme.',
      );
    }

    return data;
  }

  /// Looks up the nearest [CupertinoPlusThemeData] in the given [BuildContext].
  /// Whether the [lightTheme] or [darkTheme] is returned is determined by the
  /// [ThemeData.brightness] of the [Theme] that is closest to the given
  /// [BuildContext].
  ///
  /// If no [CupertinoPlusThemeData] can be found, this returns `null`.
  static CupertinoPlusThemeData? maybeOf(BuildContext context) {
    final cupertinoPlusTheme =
        context.dependOnInheritedWidgetOfExactType<CupertinoPlusTheme>();
    final theme = Theme.of(context);

    return theme.brightness == Brightness.light
        ? cupertinoPlusTheme?.lightTheme
        : cupertinoPlusTheme?.darkTheme;
  }

  @override
  bool updateShouldNotify(covariant CupertinoPlusTheme oldWidget) {
    if (oldWidget.lightTheme != lightTheme) {
      return true;
    } else if (oldWidget.darkTheme != darkTheme) {
      return true;
    } else {
      return false;
    }
  }
}
