import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';

class TermisAndConditionsText extends StatelessWidget {
  const TermisAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyles.font13GreyRegular.copyWith(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: ' and ',
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: 'PrivacyPolicy',
            style: TextStyles.font13GreyRegular.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
