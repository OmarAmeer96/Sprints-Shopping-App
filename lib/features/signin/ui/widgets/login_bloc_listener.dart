import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprints_shopping_app/core/helpers/extensions.dart';
import 'package:sprints_shopping_app/core/routing/routes.dart';
import 'package:sprints_shopping_app/core/theming/colors_manager.dart';
import 'package:sprints_shopping_app/core/theming/font_family_helper.dart';
import 'package:sprints_shopping_app/core/theming/styles.dart';
import 'package:sprints_shopping_app/features/signin/logic/login_cubit/login_cubit.dart';
import 'package:sprints_shopping_app/features/signin/logic/login_cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeView);
          },
          error: (error) {
            context.pop();
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  Future<dynamic> setupErrorState(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          textAlign: TextAlign.center,
          style: Styles.font14ProductName.copyWith(
            color: ColorsManager.primaryColor,
            fontSize: 15,
            fontFamily: FontFamilyHelper.clashDisplay,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: Styles.font12ProductPrice.copyWith(
                color: ColorsManager.primaryColor,
                fontSize: 15,
                fontFamily: FontFamilyHelper.clashDisplay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
