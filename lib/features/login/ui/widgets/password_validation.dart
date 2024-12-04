import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helper/spacing.dart';
import 'package:flutter_complete_project/core/theaming/colors.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/validation_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasMinLength,
      required this.hasUppercase,
      required this.hasLowerCase,
      required this.hasNumber,
      required this.hasSpecialChar});
  final bool hasMinLength,
      hasUppercase,
      hasLowerCase,
      hasNumber,
      hasSpecialChar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValidationRow(
          text: 'At least 8 characters',
          hasValidated: hasMinLength,
        ),
        verticalSpace(2),
        ValidationRow(
          text: 'At least 1 uppercase letter',
          hasValidated: hasUppercase,
        ),
        verticalSpace(2),
        ValidationRow(
          text: 'At least 1 lowercase letter',
          hasValidated: hasLowerCase,
        ),
        verticalSpace(2),
        ValidationRow(
          text: 'At least 1 number',
          hasValidated: hasNumber,
        ),
        verticalSpace(2),
        ValidationRow(
          text: 'At least 1 special character',
          hasValidated: hasSpecialChar,
        ),
      ],
    );
  }
}

