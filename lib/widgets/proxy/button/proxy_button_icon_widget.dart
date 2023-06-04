import 'package:flutter_practise_user_firebase/widgets/common/local_image_wrapper_widget.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ProxyButtonIconWidget extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const ProxyButtonIconWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.width = 100,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
          color: ThemeColors.greyBorders.withOpacity(0.49),
        )),
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: LocalImageWrapperWidget(
            image: icon,
            width: 16,
            height: 16,
          ),
        ),
      ),
    );
  }
}
