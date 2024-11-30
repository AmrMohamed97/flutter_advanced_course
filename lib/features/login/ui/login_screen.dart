import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_field.dart';
import 'package:flutter_complete_project/core/widgets/custom_button.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/already_have_account_text.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/termis_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  50.verticalSpace,
                  Text(
                    'Create Account',
                    style: TextStyles.font24BlueBold.copyWith(height: 2),
                  ),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: TextStyles.font14GreyRegular.copyWith(height: 1.5),
                  ),
                  25.verticalSpace,
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextField(
                          hintText: 'Email',
                          radius: 16,
                        ),
                        16.verticalSpace,
                        AppTextField(
                          hintText: 'Password',
                          radius: 16,
                          obscureText: isShown ? false : true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isShown = !isShown;
                              setState(() {});
                            },
                            child: isShown
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.remove_red_eye),
                          ),
                        ),
                        35.verticalSpace,
                        CustomButton(
                          title: 'Create Account',
                        ),
                        46.verticalSpace,
                        TermisAndConditionsText(),
                        20.verticalSpace,
                        AlreadyHaveAccountText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
