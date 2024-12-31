import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
import 'package:flutter_complete_project/core/widgets/custom_button.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/donot_have_account_text.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/email_and_password.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/termis_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
 
 
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      EmailAndPassword(),
                      35.verticalSpace,
                      CustomButton(
                        title: 'Create Account',
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      46.verticalSpace,
                      TermisAndConditionsText(),
                      20.verticalSpace,
                      AlreadyHaveAccountText(),
                      LoginBlocListener()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            loginRequestBody: LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
