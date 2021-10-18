import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// {@template cupertino_plus_colors}
/// A class that holds color data for Cupertino Plus themes.
///
/// Default [CupertinoPlusColors.light] and [CupertinoPlusColors.dark] themes
/// are provided, and both follow the Apple design guidelines. Themes can be
/// customized creating a custom [CupertinoPlusColors] or by using [copyWith] to
/// customize an existing theme.
///
/// See also:
/// * The [Apple Design Guidelines on Colors](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/).
/// * [CupertinoPlusTheme], which is a widget used to provide Cupertino Plus
///   theme data to the rest of the application, analogous to [Theme].
/// {@endtemplate}
class CupertinoPlusColors extends Equatable {
  /// {@macro cupertino_plus_colors}
  const CupertinoPlusColors({
    required this.brightness,
    required this.systemRed,
    required this.systemOrange,
    required this.systemYellow,
    required this.systemGreen,
    required this.systemMint,
    required this.systemTeal,
    required this.systemCyan,
    required this.systemBlue,
    required this.systemIndigo,
    required this.systemPurple,
    required this.systemPink,
    required this.systemBrown,
    required this.systemGray,
    required this.systemGray2,
    required this.systemGray3,
    required this.systemGray4,
    required this.systemGray5,
    required this.systemGray6,
  });

  /// Creates a light [CupertinoPlusColors] theme with default values.
  const CupertinoPlusColors.light({
    this.brightness = Brightness.light,
    this.systemRed = const Color.fromARGB(255, 255, 59, 48),
    this.systemOrange = const Color.fromARGB(255, 255, 149, 0),
    this.systemYellow = const Color.fromARGB(255, 255, 204, 0),
    this.systemGreen = const Color.fromARGB(255, 52, 199, 89),
    this.systemMint = const Color.fromARGB(255, 0, 199, 190),
    this.systemTeal = const Color.fromARGB(255, 48, 176, 199),
    this.systemCyan = const Color.fromARGB(255, 50, 173, 230),
    this.systemBlue = const Color.fromARGB(255, 0, 122, 255),
    this.systemIndigo = const Color.fromARGB(255, 88, 86, 214),
    this.systemPurple = const Color.fromARGB(255, 175, 82, 222),
    this.systemPink = const Color.fromARGB(255, 255, 45, 85),
    this.systemBrown = const Color.fromARGB(255, 162, 132, 94),
    this.systemGray = const Color.fromARGB(255, 142, 142, 147),
    this.systemGray2 = const Color.fromARGB(255, 174, 174, 178),
    this.systemGray3 = const Color.fromARGB(255, 199, 199, 204),
    this.systemGray4 = const Color.fromARGB(255, 209, 209, 214),
    this.systemGray5 = const Color.fromARGB(255, 229, 229, 234),
    this.systemGray6 = const Color.fromARGB(255, 242, 242, 247),
  });

  /// Creates a dark [CupertinoPlusColors] theme with default values.
  const CupertinoPlusColors.dark({
    this.brightness = Brightness.dark,
    this.systemRed = const Color.fromARGB(255, 255, 69, 58),
    this.systemOrange = const Color.fromARGB(255, 255, 159, 10),
    this.systemYellow = const Color.fromARGB(255, 255, 214, 10),
    this.systemGreen = const Color.fromARGB(255, 48, 209, 88),
    this.systemMint = const Color.fromARGB(255, 102, 212, 207),
    this.systemTeal = const Color.fromARGB(255, 64, 200, 224),
    this.systemCyan = const Color.fromARGB(255, 100, 210, 255),
    this.systemBlue = const Color.fromARGB(255, 10, 132, 255),
    this.systemIndigo = const Color.fromARGB(255, 94, 92, 230),
    this.systemPurple = const Color.fromARGB(255, 191, 90, 242),
    this.systemPink = const Color.fromARGB(255, 255, 55, 95),
    this.systemBrown = const Color.fromARGB(255, 172, 142, 104),
    this.systemGray = const Color.fromARGB(255, 142, 142, 147),
    this.systemGray2 = const Color.fromARGB(255, 99, 99, 102),
    this.systemGray3 = const Color.fromARGB(255, 72, 72, 74),
    this.systemGray4 = const Color.fromARGB(255, 58, 58, 60),
    this.systemGray5 = const Color.fromARGB(255, 44, 44, 46),
    this.systemGray6 = const Color.fromARGB(255, 28, 28, 30),
  });

  // TODO(@jeroen-meijer): Remove this line and add documentation.
  // ignore_for_file: public_member_api_docs

  final Brightness brightness;
  final Color systemRed;
  final Color systemOrange;
  final Color systemYellow;
  final Color systemGreen;
  final Color systemMint;
  final Color systemTeal;
  final Color systemCyan;
  final Color systemBlue;
  final Color systemIndigo;
  final Color systemPurple;
  final Color systemPink;
  final Color systemBrown;
  final Color systemGray;
  final Color systemGray2;
  final Color systemGray3;
  final Color systemGray4;
  final Color systemGray5;
  final Color systemGray6;

  /// Looks up the nearest [CupertinoPlusTheme] in the given [BuildContext] and
  /// returns its colors.
  ///
  /// If no [CupertinoPlusTheme] can be found, this throws a [FlutterError].
  static CupertinoPlusColors of(BuildContext context) {
    return CupertinoPlusTheme.of(context).colors;
  }

  /// Looks up the nearest [CupertinoPlusTheme] in the given [BuildContext] and
  /// returns its colors.
  ///
  /// If no [CupertinoPlusTheme] can be found, this returns `null`.
  static CupertinoPlusColors? maybeOf(BuildContext context) {
    return CupertinoPlusTheme.maybeOf(context)?.colors;
  }

  /// Creates a copy of this theme with the given fields replaced with the new
  /// values.
  CupertinoPlusColors copyWith({
    Brightness? brightness,
    Color? systemRed,
    Color? systemOrange,
    Color? systemYellow,
    Color? systemGreen,
    Color? systemMint,
    Color? systemTeal,
    Color? systemCyan,
    Color? systemBlue,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemPink,
    Color? systemBrown,
    Color? systemGray,
    Color? systemGray2,
    Color? systemGray3,
    Color? systemGray4,
    Color? systemGray5,
    Color? systemGray6,
  }) {
    return CupertinoPlusColors(
      brightness: brightness ?? this.brightness,
      systemRed: systemRed ?? this.systemRed,
      systemOrange: systemOrange ?? this.systemOrange,
      systemYellow: systemYellow ?? this.systemYellow,
      systemGreen: systemGreen ?? this.systemGreen,
      systemMint: systemMint ?? this.systemMint,
      systemTeal: systemTeal ?? this.systemTeal,
      systemCyan: systemCyan ?? this.systemCyan,
      systemBlue: systemBlue ?? this.systemBlue,
      systemIndigo: systemIndigo ?? this.systemIndigo,
      systemPurple: systemPurple ?? this.systemPurple,
      systemPink: systemPink ?? this.systemPink,
      systemBrown: systemBrown ?? this.systemBrown,
      systemGray: systemGray ?? this.systemGray,
      systemGray2: systemGray2 ?? this.systemGray2,
      systemGray3: systemGray3 ?? this.systemGray3,
      systemGray4: systemGray4 ?? this.systemGray4,
      systemGray5: systemGray5 ?? this.systemGray5,
      systemGray6: systemGray6 ?? this.systemGray6,
    );
  }

  @override
  List<Object> get props => [
        brightness,
        systemRed,
        systemOrange,
        systemYellow,
        systemGreen,
        systemMint,
        systemTeal,
        systemCyan,
        systemBlue,
        systemIndigo,
        systemPurple,
        systemPink,
        systemBrown,
        systemGray,
        systemGray2,
        systemGray3,
        systemGray4,
        systemGray5,
        systemGray6,
      ];
}
