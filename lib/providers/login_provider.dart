import 'package:flutter/material.dart';

import 'package:test_tots/core/preference.dart';
import 'package:test_tots/helpers/dialog_helper.dart';
import 'package:test_tots/models/auth_model.dart';
import 'package:test_tots/repository/auth_repository.dart';
import 'package:test_tots/screens/home_screen.dart';

class LoginProvider with ChangeNotifier {
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  bool showPassword = false;
  Auth? auth;

  Future<void> onLogin({required BuildContext context}) async {
    try {
      if (!myFormKey.currentState!.validate()) {
        return;
      }

      var resp = await AuthRepository.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      if (resp.success == false) {
        if (!context.mounted) return;
        DialogHelper.customShowDialog(
            context: context, text: resp.error.message);
        return;
      }

      auth = resp.response;
      Preferences.token = auth!.accessToken;
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } catch (e) {
      DialogHelper.customShowDialog(context: context, text: 'Unexpected error');
      return;
    }
  }

  void onShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
