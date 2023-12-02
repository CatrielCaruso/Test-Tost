import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:test_tots/helpers/validation_helper.dart';
import 'package:test_tots/providers/login_provider.dart';
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
                            height: 0.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D1111)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInputWidget(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: readLoginProvider.emailController,
                        validator: ValidationHelper.onErrorEmail,
                        label: 'Mail',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomInputWidget(
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
                                  color: const Color.fromRGBO(13, 30, 50, 0.38),
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () =>
                            readLoginProvider.onLogin(context: context),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 14),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D1111),
                            borderRadius: BorderRadius.all(
                              Radius.circular(34),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(45, 44, 131, 0.25),
                                offset: Offset(
                                  0.0,
                                  4.0,
                                ),
                                blurRadius: 15.0,
                              ), //BoxShadow
                              //BoxShadow
                            ],
                          ),
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
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
