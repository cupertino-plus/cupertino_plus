import 'package:cupertino_plus/cupertino_plus.dart';
import 'package:flutter/material.dart';

// TODO(jeroen-meijer): Remove this line and add documentation.
// ignore_for_file: public_member_api_docs

enum CupertinoPlusDividerBehavior {
  /// Show no dividers by default.
  none,

  /// Show regular dividers between all list items.
  regular,

  /// Show dividers suited for icon list tiles between all list items.
  icon,
}

class CupertinoPlusListTileGroup extends StatelessWidget {
  const CupertinoPlusListTileGroup({
    Key? key,
    this.dividerBehavior = CupertinoPlusDividerBehavior.regular,
    this.padding = _kDefaultPadding,
    this.title,
    this.children = const <Widget>[],
  }) : super(key: key);

  static const _kDefaultPadding = EdgeInsets.only(
    left: 16,
    right: 16,
    bottom: 32,
  );

  static const _kBorderRadius = 8.0;

  static const _kBackgroundColorLight = Color(0xFFFFFFFF);
  static const _kBackgroundColorDark = Color(0xFF1C1C1E);

  T _selectByTheme<T>(BuildContext context, T light, T dark) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  final CupertinoPlusDividerBehavior dividerBehavior;
  final EdgeInsets padding;
  final Widget? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    late final Widget? divider;

    switch (dividerBehavior) {
      case CupertinoPlusDividerBehavior.regular:
        divider = const CupertinoPlusListTileDivider();
        break;
      case CupertinoPlusDividerBehavior.icon:
        divider = const CupertinoPlusListTileDivider.forIconTile();
        break;
      case CupertinoPlusDividerBehavior.none:
        divider = null;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.caption,
              child: title!,
            ),
          ),
        Padding(
          padding: padding,
          child: Material(
            borderRadius: BorderRadius.circular(_kBorderRadius),
            clipBehavior: Clip.antiAlias,
            color: _selectByTheme(
              context,
              _kBackgroundColorLight,
              _kBackgroundColorDark,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < children.length; i++) ...[
                  if (i > 0 && divider != null) divider,
                  children[i],
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}
