import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprints_shopping_app/core/helpers/spacing.dart';
import 'package:sprints_shopping_app/core/theming/colors_manager.dart';
import 'package:sprints_shopping_app/core/theming/styles.dart';
import 'package:sprints_shopping_app/core/widgets/custom_main_button.dart';
import 'package:sprints_shopping_app/features/signin/logic/login_cubit/login_cubit.dart';
import 'package:sprints_shopping_app/features/signin/ui/widgets/do_not_have_an_account_text.dart';
import 'package:sprints_shopping_app/features/signin/ui/widgets/login_bloc_listener.dart';
import 'package:sprints_shopping_app/features/signin/ui/widgets/login_email_and_password_widget.dart';
import 'package:sprints_shopping_app/features/signin/ui/widgets/login_view_welcome_texts.dart';
import 'package:sprints_shopping_app/features/home/widgets/custom_positioned_home_overlay.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          CustomPositionedHomeOverlay(),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 24.h,
                      left: 24.w,
                      right: 24.w,
                      bottom: 24.h,
                    ),
                    child: Column(
                      children: [
                        const LoginViewWelcomeTexts(),
                        verticalSpace(32),
                        Column(
                          children: [
                            const LoginEmailAndPasswordWidget(),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: Styles.font12HomeBanner.copyWith(
                                    color: ColorsManager.textFieldFillColor,
                                  ),
                                ),
                              ),
                            ),
                            verticalSpace(42),
                            CustomMainButton(
                              onPressed: () {
                                validateThenLogin(context);
                              },
                              buttonText: 'Login',
                            ),
                            verticalSpace(60),
                            const DontHaveAccountText(),
                            const LoginBlocListener(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
