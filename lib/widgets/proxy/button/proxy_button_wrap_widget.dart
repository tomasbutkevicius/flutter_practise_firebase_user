
import 'package:flutter/material.dart';

class ProxyButtonWrapWidget extends StatelessWidget {
  final Color? color;
  final Widget child;
  final Size minimumSize;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;
  final double? borderRadius;

  const ProxyButtonWrapWidget({
    Key? key,
    this.color,
    this.onLongPress,
    this.borderColor = Colors.black,
    this.borderRadius = 15,
    required this.child,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.minimumSize = const Size(0, 0),
  }) : super(key: key);

  OutlinedBorder get _shape => RoundedRectangleBorder(
    side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!),
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: TextButton.styleFrom(
        shape: _shape,
        padding: padding,
        backgroundColor: color,
        minimumSize: minimumSize,
      ),
      child: child,
    );
  }
}
