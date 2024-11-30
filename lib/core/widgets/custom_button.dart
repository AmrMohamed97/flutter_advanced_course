import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helper/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theaming/colors.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width,
      this.height,
      this.horizontalPadding,
      this.verticalPadding,
      this.backgroundColor, required this.title});
  final double? width, height, horizontalPadding, verticalPadding;
  final Color? backgroundColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? ColorsManager.mainBlue,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(
          Size(width ?? double.infinity, height ?? 50.h),
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 12.w,
            vertical: verticalPadding ?? 14.h)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyles.font16WhiteSemibold,
      ),
    );
  }
}
