import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helper/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error,
          size: 32,
          color: Colors.red,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
              onPressed: () => context.pop(),
              child: Text(
                'Got it',
                style: TextStyles.font14BlueSemibold,
              ))
        ],
      ),
    );
  }
}
