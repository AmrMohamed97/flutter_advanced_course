import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theaming/colors.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Already have an account yet? ', style: TextStyles.font13GreyRegular,),
          TextSpan(text: 'Sign Up',style: TextStyles.font13GreyRegular.copyWith(color:ColorsManager.mainBlue,),),
           
        ],
      ),
    );
  }
}