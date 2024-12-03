import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theaming/colors.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValidationRow extends StatelessWidget {
  const ValidationRow(
      {super.key, required this.text, required this.hasValidated});
  final String text;
  final bool hasValidated;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.grey,
        ),
        5.horizontalSpace,
        Text(
          text,
          style: TextStyles.font13GreyRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.grey : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
