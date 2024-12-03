import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helper/spacing.dart';
import 'package:flutter_complete_project/core/widgets/app_text_field.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/app_regex.dart';
import 'package:flutter_complete_project/features/login/ui/widgets/password_validation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isShown = false;
  late TextEditingController passwordController;
  bool hasMinLength = false;
  bool hasUppercase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextField(
            hintText: 'Email',
            radius: 16,
            controller: context.read<LoginCubit>().emailController,
            validator: (val) {
              if (val!.isEmpty || !AppRegex.isEmailValid(val)) {
                return 'Please enter a vaid email';
              }
              return null;
            },
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
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please enter valid password';
              }
              return null;
            },
            controller: context.read<LoginCubit>().passwordController,
          ),
          verticalSpace(24),
          PasswordValidation(
              hasMinLength: hasMinLength,
              hasUppercase: hasUppercase,
              hasLowerCase: hasLowerCase,
              hasNumber: hasNumber,
              hasSpecialChar: hasSpecialChar)
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
