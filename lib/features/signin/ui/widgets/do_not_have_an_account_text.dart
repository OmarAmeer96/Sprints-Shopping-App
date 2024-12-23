import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprints_shopping_app/core/helpers/extensions.dart';
import 'package:sprints_shopping_app/core/routing/routes.dart';
import 'package:sprints_shopping_app/core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: Styles.font20WhiteSemiBold.copyWith(
              color: Colors.black,
              fontSize: 13.sp,
            ),
          ),
          TextSpan(
            text: ' Sign Up',
            style: Styles.font20WhiteSemiBold.copyWith(
              fontSize: 13.sp,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signupView);
              },
          ),
        ],
      ),
    );
  }
}
