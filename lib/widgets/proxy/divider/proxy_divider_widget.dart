import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';

class ProxyDividerHorizontalWidget extends StatelessWidget {
  final bool flex;
  final double height;
  final double? indent;
  final double? endIndent;
  final Color color;

  const ProxyDividerHorizontalWidget({
    Key? key,
    this.flex = false,
    this.height = 20.0,
    this.indent,
    this.endIndent,
    this.color = ThemeColors.grey,
  }) : super(key: key);

  Widget _builder() {
    return Divider(
      height: height,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flex) {
      return Flexible(
        child: _builder(),
      );
    }

    return _builder();
  }
}

class ProxyDividerVerticalWidget extends StatelessWidget {
  final bool flex;
  final double width;
  final double? indent;
  final double? endIndent;

  const ProxyDividerVerticalWidget({
    Key? key,
    this.flex = false,
    this.width = 20.0,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  Widget _builder() {
    return VerticalDivider(
      width: width,
      indent: indent,
      endIndent: endIndent,
      color: ThemeColors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flex) {
      return Flexible(
        child: _builder(),
      );
    }

    return _builder();
  }
}
