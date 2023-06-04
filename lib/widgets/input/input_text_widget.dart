import 'package:flutter_practise_user_firebase/widgets/proxy/text/proxy_text_widget.dart';
import 'package:flutter_practise_user_firebase/utilities/form/form_validators.dart';
import 'package:flutter_practise_user_firebase/utilities/common_utilities.dart';
import 'package:flutter_practise_user_firebase/theme/theme_colors.dart';
import 'package:flutter_practise_user_firebase/constants/regexp.dart';
import 'package:flutter_practise_user_firebase/constants/proxy.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget extends StatelessWidget {
  final bool? filled;
  final String label;
  final int? maxLength;
  final bool obscureText;
  final FocusNode? focusNode;
  final String? formGroupName;
  final String formControlName;
  final VoidCallback? onSubmitted;
  final ReactiveFormFieldCallback? onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final bool denyEmoji;
  final Color textColor;
  final Color labelColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color errorColor;

  const InputTextWidget({
    Key? key,
    required this.label,
    this.filled = true,
    this.focusNode,
    this.maxLength,
    this.onSubmitted,
    this.onChanged,
    this.formGroupName,
    required this.formControlName,
    this.inputFormatters = const [],
    this.obscureText = false,
    this.denyEmoji = true,
    this.keyboardType = TextInputType.visiblePassword,
    this.textInputAction = TextInputAction.next,
    this.textColor = ThemeColors.greyTextDark,
    this.labelColor = ThemeColors.greyTextLabel,
    this.borderColor = ThemeColors.greyInputFill,
    this.errorColor = ThemeColors.red,
    this.backgroundColor = ThemeColors.greyInputFill,
  }) : super(key: key);

  String get fullFormControlName => CommonUtilities.joinList([formGroupName, formControlName], separator: '.');

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      focusNode: focusNode,
      minLines: keyboardType == TextInputType.multiline ? 3 : null,
      maxLines: keyboardType == TextInputType.multiline ? null : 1,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: (_) => onSubmitted,
      onChanged: onChanged,
      inputFormatters: [...inputFormatters, if (denyEmoji) FilteringTextInputFormatter.deny(RegexpConstants.emoji)],
      formControlName: fullFormControlName,
      validationMessages: FormValidators.validationMessages(),
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        counterStyle: TextStyle(color: textColor),
        filled: filled,
        label: ProxyTextWidget(
          text: label,
          fontSize: ProxyFontSize.small,
          color: labelColor,
        ),
        errorStyle: TextStyle(
          color: errorColor,
        ),
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }
}
