import 'package:flutter/material.dart';
import 'package:test_tots/screens/home_screen.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  bool showPassword = false;

  Future<void> onLogin({required BuildContext context}) async {
    try {
      if (!myFormKey.currentState!.validate()) {
        return;
      }

      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } catch (e) {}
  }

  void onShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
