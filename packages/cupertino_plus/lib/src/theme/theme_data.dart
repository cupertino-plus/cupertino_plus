import 'package:cupertino_plus/cupertino_plus.dart';

// TODO(jeroen-meijer): Add documentation.

/// {@template cupertino_plus_theme_data}
/// A theme data class used by Cupertino Plus widgets.
///
/// {@endtemplate}
class CupertinoPlusThemeData {
  /// {@macro cupertino_plus_theme_data}
  const CupertinoPlusThemeData({
    required this.colors,
    // TODO(jeroen-meijer): Add other properties here.
  });

  /// The default theme for light-themed Cupertino Plus widgets.
  const CupertinoPlusThemeData.light({
    this.colors = const CupertinoPlusColors.light(),
  });

  /// The default theme for dark-themed Cupertino Plus widgets.
  const CupertinoPlusThemeData.dark({
    this.colors = const CupertinoPlusColors.dark(),
  });

  /// The colors used to style the Cupertino Plus widgets.
  final CupertinoPlusColors colors;
}
