import 'package:cupertinew/cupertinew.dart';

/// {@template cupertinew_theme_data}
/// A theme data class used by Cupertinew widgets.
///
/// TODO(@jeroen-meijer): Add documentation.
/// {@endtemplate}
class CupertinewThemeData {
  /// {@macro cupertinew_theme_data}
  const CupertinewThemeData({
    required this.colors,
    // TODO: Add other properties here.
  });

  /// The default theme for light-themed Cupertinew widgets.
  const CupertinewThemeData.light({
    this.colors = const CupertinewColors.light(),
  });

  /// The default theme for dark-themed Cupertinew widgets.
  const CupertinewThemeData.dark({
    this.colors = const CupertinewColors.dark(),
  });

  /// The colors used to style the Cupertinew widgets.
  final CupertinewColors colors;
}
