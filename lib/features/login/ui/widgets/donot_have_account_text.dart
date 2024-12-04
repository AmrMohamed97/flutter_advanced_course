import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helper/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theaming/colors.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'don\'t have an account yet? ',
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13GreyRegular.copyWith(
              color: ColorsManager.mainBlue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}
