import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helper/extensions.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
 
import '../../../../core/routing/routes.dart';
 
class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font13GreyRegular,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}