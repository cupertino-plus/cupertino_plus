import 'dart:async';

import 'package:flutter/material.dart';

// DEV NOTE: This component is a quick, dirty and eye-balled version of the iOS
// list tile (or whatever it's called in the iOS world). It's not meant to be
// production-ready, but may be used for inspiration.
// ---------
// The Flutter "Veggie Seasons" example project might be useful as reference for
// some components.
//
// https://github.com/flutter/samples/tree/master/veggieseasons
// ---------

/// {@template cupertino_plus_list_tile}
/// A quick, dirty and eye-balled version of the iOS list tile.
/// Do not use this.
///
/// TODO(@jeroen-meijer): Add documentation.
/// {@endtemplate}
class CupertinoPlusListTile extends StatefulWidget {
  /// {@macro cupertino_plus_list_tile}
  const CupertinoPlusListTile({
    Key? key,
    this.isNavigationButton = false,
    this.enabled = true,
    this.onTap,
    this.iconBackgroundColor,
    this.iconColor,
    this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
  }) : super(key: key);

  // TODO(@jeroen-meijer): Remove this line and add documentation.
  // ignore_for_file: public_member_api_docs

  final bool isNavigationButton;
  final bool enabled;
  final VoidCallback? onTap;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final Widget? icon;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  _CupertinoPlusListTileState createState() => _CupertinoPlusListTileState();
}

class _CupertinoPlusListTileState extends State<CupertinoPlusListTile>
    with SingleTickerProviderStateMixin {
  /// The minimum inner height (inside the padding) of the list tile.
  static const _kMinInnerHeight = 26.0;

  static const _kBackgroundColorLight = Color(0xFFFFFFFF);
  static const _kBackgroundColorDark = Color(0xFF1C1C1E);

  static const _kHighlightColorLight = Color(0xFFE5E4EA);
  static const _kHighlightColorDark = Color(0xFF2C2C2E);

  static const _kTextColorLight = Color(0xFF000000);
  static const _kTextColorDark = Color(0xFFFFFFFF);

  static const _kSecondaryTextColorLight = Color(0xFF99989F);
  static const _kSecondaryTextColorDark = Color(0xFF8A898E);

  /// The factor of how transparent the tile is when it's disabled.
  static const _kDisabledOpacity = 0.38;

  static const _kIconColor = Colors.white;
  static const _kIconSize = 20.0;
  static const _kIconBorderRadius = 7.0;
  static const _kIconInnerPadding = 3.0;

  static const _kTrailingIconColorLight = Color(0xFFC4C4C6);
  static const _kTrailingIconColorDark = Color(0xFF595A5F);
  static const _kTrailingIconSize = 14.0;

  static const _kPaddingWidth = 16.0;
  static const _kPaddingHeight = 6.0;

  static const _kSubtitlePaddingHeight = 0.0;

  /// This is the default timeout between when the user presses the button and
  /// when the button is highlighted on iOS.
  static const _kHighlightTimeout = Duration(milliseconds: 200);

  var _isHighlighted = false;

  bool get _isInteractive => widget.enabled && widget.onTap != null;

  Timer? _highlightTimer;

  T _selectByTheme<T>(T light, T dark) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  void _onPressStateChanged(bool isPressed) {
    if (!_isInteractive) {
      return;
    }

    _highlightTimer?.cancel();
    setState(() {
      _isHighlighted = false;
    });
    if (isPressed) {
      _highlightTimer = Timer(_kHighlightTimeout, () {
        setState(() {
          _isHighlighted = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _highlightTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onPressStateChanged(true),
      onTapUp: (_) => _onPressStateChanged(false),
      onTapCancel: () => _onPressStateChanged(false),
      onTap: !widget.enabled ? null : widget.onTap,
      child: Material(
        color: _isHighlighted
            ? _selectByTheme(_kHighlightColorLight, _kHighlightColorDark)
            : _selectByTheme(_kBackgroundColorLight, _kBackgroundColorDark),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: _selectByTheme(_kTextColorLight, _kTextColorDark),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: _kPaddingHeight,
              horizontal: _kPaddingWidth,
            ),
            child: Opacity(
              opacity: widget.enabled ? 1.0 : _kDisabledOpacity,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: _kMinInnerHeight,
                ),
                child: Row(
                  children: [
                    if (widget.icon != null) ...[
                      SizedBox(
                        width: _kIconSize + _kIconInnerPadding * 2,
                        child: Material(
                          color:
                              widget.iconBackgroundColor ?? Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(_kIconBorderRadius),
                            side: widget.iconBackgroundColor == null
                                ? BorderSide.none
                                : BorderSide(
                                    color: _selectByTheme(
                                      Colors.transparent,
                                      Colors.white.withOpacity(0.3),
                                    ),
                                    width: 0.5,
                                  ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(_kIconInnerPadding),
                            child: IconTheme.merge(
                              data: const IconThemeData(
                                color: _kIconColor,
                                size: _kIconSize,
                              ),
                              child: widget.icon!,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: _kPaddingWidth),
                    ],
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextStyle.merge(
                            overflow: TextOverflow.ellipsis,
                            child: widget.title,
                          ),
                          if (widget.subtitle != null) ...[
                            const SizedBox(height: _kSubtitlePaddingHeight),
                            DefaultTextStyle.merge(
                              style: (Theme.of(context).textTheme.caption ??
                                      const TextStyle())
                                  .copyWith(
                                fontSize: 12,
                                color: _selectByTheme(
                                  _kSecondaryTextColorLight,
                                  _kSecondaryTextColorDark,
                                ),
                              ),
                              child: widget.subtitle!,
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (widget.trailing != null) ...[
                      const SizedBox(width: _kPaddingWidth),
                      DefaultTextStyle.merge(
                        style: TextStyle(
                          color: _selectByTheme(
                            _kSecondaryTextColorLight,
                            _kSecondaryTextColorDark,
                          ),
                        ),
                        child: widget.trailing!,
                      ),
                    ],
                    if (widget.isNavigationButton && _isInteractive) ...[
                      const SizedBox(width: _kPaddingWidth),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: _selectByTheme(
                            _kTrailingIconColorLight, _kTrailingIconColorDark),
                        size: _kTrailingIconSize,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
