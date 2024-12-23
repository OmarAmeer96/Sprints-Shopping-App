import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprints_shopping_app/core/helpers/app_regex.dart';
import 'package:sprints_shopping_app/core/helpers/spacing.dart';
import 'package:sprints_shopping_app/core/theming/colors_manager.dart';
import 'package:sprints_shopping_app/core/theming/styles.dart';
import 'package:sprints_shopping_app/core/widgets/custom_main_text_form_field.dart';
import 'package:sprints_shopping_app/core/widgets/password_vlaidations.dart';
import 'package:sprints_shopping_app/features/signin/logic/login_cubit/login_cubit.dart';

class LoginEmailAndPasswordWidget extends StatefulWidget {
  const LoginEmailAndPasswordWidget({super.key});

  @override
  State<LoginEmailAndPasswordWidget> createState() =>
      _LoginEmailAndPasswordWidgetState();
}

class _LoginEmailAndPasswordWidgetState
    extends State<LoginEmailAndPasswordWidget> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomMainTextFormFiels(
            labelText: 'Email',
            labelStyle: Styles.font12ProductName,
            isObscureText: false,
            style: Styles.font12ProductName,
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter your email';
              }
            },
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: ColorsManager.accentColor,
            ),
            focusNode: emailFocusNode,
            nextFocusNode: passwordFocusNode,
            fillColor: Colors.transparent,
          ),
          verticalSpace(18),
          CustomMainTextFormFiels(
            labelText: 'Password',
            labelStyle: Styles.font12ProductName,
            isObscureText: isObscureText,
            style: Styles.font12ProductName,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.accentColor,
              ),
            ),
            prefixIcon: const Icon(
              Icons.password_rounded,
              color: ColorsManager.accentColor,
            ),
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
            },
            focusNode: passwordFocusNode,
            fillColor: Colors.transparent,
          ),
          verticalSpace(18),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
