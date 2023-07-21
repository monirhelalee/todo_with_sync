import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sync/core/utils/validator.dart';
import 'package:todo_with_sync/core/widgets/common_button.dart';
import 'package:todo_with_sync/core/widgets/common_text_field.dart';
import 'package:todo_with_sync/features/auth/view_model/signin_view_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signInVm = SignInViewModel.watch(context);
    final width = MediaQuery.of(context).size.width;
    const spaceBetween = SizedBox(
      height: 10,
    );
    const welcomeTextWidget = Text(
      'Welcome',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
    const signInToContinueTextWidget = Text(
      'Sign in to continue',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: Colors.grey,
      ),
    );
    final emailWidget = CommonTextField(
      prefixIcon: const Icon(Icons.person_2_outlined),
      controller: signInVm.emailController,
      validator: Validator().nullFieldValidate,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(signInVm.passwordFocus);
      },
      hintText: 'User Name',
    );
    final passwordWidget = CommonTextField(
      focusNode: signInVm.passwordFocus,
      controller: signInVm.passwordController,
      validator: Validator().nullFieldValidate,
      prefixIcon: const Icon(Icons.lock_outline),
      hintText: 'Password',
      obSecure: true,
      onFieldSubmitted: (v) async {
        FocusManager.instance.primaryFocus!.unfocus();
        if (signInVm.formKey.currentState!.validate()) {
          await signInVm.onLogin();
        }
      },
    );
    final signInButton = Consumer<SignInViewModel>(
      builder: (context, signInVm, _) {
        return signInVm.isLoading
            ? const Center(child: CircularProgressIndicator())
            : CommonButton(
                buttonTitle: 'SIGN IN',
                onTap: () async {
                  if (signInVm.formKey.currentState!.validate()) {
                    await signInVm.onLogin();
                  }
                },
              );
      },
    );
    return Scaffold(
      body: Form(
        key: signInVm.formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: width <= 420 ? width * .35 : 100,
                ),
                spaceBetween,
                spaceBetween,
                welcomeTextWidget,
                spaceBetween,
                signInToContinueTextWidget,
                spaceBetween,
                spaceBetween,
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      emailWidget,
                      spaceBetween,
                      spaceBetween,
                      passwordWidget,
                      spaceBetween,
                      spaceBetween,
                      spaceBetween,
                      signInButton,
                      spaceBetween,
                      spaceBetween,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
