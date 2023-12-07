import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:test_tots/helpers/validation_helper.dart';
import 'package:test_tots/providers/login_provider.dart';
import 'package:test_tots/theme/custom_style_theme.dart';
import 'package:test_tots/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readLoginProvider = context.read<LoginProvider>();
    final watchLoginProvider = context.watch<LoginProvider>();
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/img/vector_top.png'),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('assets/img/vector_center.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/img/vector_bottom.png'),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Form(
                  key: readLoginProvider.myFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/text_image.png'),
                      const Text(
                        'LOG IN',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: CustomStylesTheme.fontFamilyDMsans,
                          fontWeight: CustomStylesTheme.fontWeightBold,
                          color: CustomStylesTheme.textDarkColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputWidget(
                        onTapOutside: (event) =>
                            readLoginProvider.focusNodeEmail.unfocus(),
                        focusNode: readLoginProvider.focusNodeEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: readLoginProvider.emailController,
                        validator: ValidationHelper.onErrorEmail,
                        label: 'Mail',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputWidget(
                        onTapOutside: (event) =>
                            readLoginProvider.focusNodePassword.unfocus(),
                        focusNode: readLoginProvider.focusNodePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: readLoginProvider.passwordController,
                        validator: ValidationHelper.onErrorFieldEmpty,
                        obscureText: !readLoginProvider.showPassword,
                        label: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () => readLoginProvider.onShowPassword(),
                            icon: SizedBox(
                              width: 22,
                              height: 15,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Icon(
                                  (watchLoginProvider.showPassword)
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: CustomStylesTheme.iconGreyColor,
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AbsorbPointer(
                        absorbing: watchLoginProvider.isLoading,
                        child: GestureDetector(
                          onTap: () =>
                              readLoginProvider.onLogin(context: context),
                          child: (watchLoginProvider.isLoading)
                              ? const CircularProgressIndicator(
                                  color: CustomStylesTheme.textDarkColor,
                                )
                              : const CustomButtomWidget(
                                  title: 'LOG IN',
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
