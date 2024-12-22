import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_project/core/theaming/colors.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.hintText,
      this.textInputType,
      this.controller,
      this.onFieldSubmitted,
      this.maxLines = 1,
      this.focusNode,
      this.obscureText,
      this.onSaved,
      this.validator,
      this.inputDecoration,
      this.prefixIcon,
      this.maxLength,
      this.maxLengthEnforcement,
      this.onChanged,
      this.textStyle,
      this.counter,
      this.hintStyle,
      this.borderColor,
      this.radius,
      this.filled,
      this.filledColor,
      this.suffixIcon,
      this.textAlign,
      this.enabled,
      this.cursorColor});
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final ValueSetter? onFieldSubmitted, onSaved, onChanged;
  final String? Function(String?)? validator;
  final int maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final bool? obscureText, filled, enabled;
  final InputDecoration? inputDecoration;
  final Widget? prefixIcon, suffixIcon, counter;
  final TextStyle? textStyle, hintStyle;
  final Color? borderColor, filledColor, cursorColor;
  final double? radius;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      decoration: inputDecoration ??
          InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? TextStyles.font14GreyRegular,
            border: outLineBorder(),
            focusedBorder: outLineBorder(),
            enabledBorder: outLineBorder(),
            filled: filled,
            fillColor: filledColor,
            isDense: true,
            // contentPadding: EdgeInsets.zero,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            counter: counter,
          ),
      cursorColor: cursorColor ?? ColorsManager.grey,
      keyboardType: textInputType,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      maxLines: maxLines,
      // minLines: minLine??1,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLength: maxLength,
      onChanged: onChanged,
      style: textStyle,
    );
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      borderSide: BorderSide(
        color: borderColor ?? ColorsManager.lightGrey,
      ),
    );
  }
}
