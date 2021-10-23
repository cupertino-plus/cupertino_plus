import 'package:flutter/material.dart';

// TODO(jeroen-meijer): Remove this line and add documentation.
// ignore_for_file: public_member_api_docs

class CupertinoPlusListTileDivider extends StatelessWidget {
  const CupertinoPlusListTileDivider({
    Key? key,
    this.height = 0,
    this.thickness = 1,
    this.indent = 16,
    this.endIndent = 0,
    this.color,
  })  : assert(
          height == null || height >= 0,
          'The height of the divider must not be negative.',
        ),
        assert(
          thickness == null || thickness >= 0,
          'The thickness of the divider must not be negative.',
        ),
        assert(
          indent == null || indent >= 0,
          'The indent of the divider must not be negative.',
        ),
        assert(
          endIndent == null || endIndent >= 0,
          'The end indent of the divider must not be negative.',
        ),
        super(key: key);

  const CupertinoPlusListTileDivider.forIconTile({
    Key? key,
    double? height = 0,
    double? thickness = 1,
    double indent = /* between 48 and 64 is */ 56,
    double endIndent = 0,
    Color? color,
  }) : this(
          key: key,
          height: height,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          color: color,
        );

  static const _kColorLight = Color(0xFFC6C6C8);
  static const _kColorDark = Color(0xFF3D3C41);

  /// The divider's height extent.
  final double? height;

  /// The divider's thickness.
  final double? thickness;

  /// The amount of empty space to the left of the divider.
  final double? indent;

  /// The amount of empty space to the right of the divider.
  final double? endIndent;

  /// The color to use when painting the line.
  final Color? color;

  T _selectByTheme<T>(BuildContext context, T light, T dark) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color ?? _selectByTheme(context, _kColorLight, _kColorDark),
    );
  }
}
