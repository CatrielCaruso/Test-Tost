import 'dart:convert';
import 'dart:io';

import 'package:test_tots/screens/home_screen.dart';

import '../models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:test_tots/helpers/dialog_helper.dart';
import 'package:test_tots/repository/client_repository.dart';

class AbmClientProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController firtsNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeFirstName = FocusNode();
  FocusNode focusNodeLastName = FocusNode();
  FocusNode focusNodeAdress = FocusNode();
  bool isLoading = false;
  File? image;

  Future<void> onSaved({required BuildContext context}) async {
    Map<String, dynamic> formUser = {
      "email": emailController.text.trim(),
      "firstname": firtsNameController.text.trim(),
      "lastname": lastNameController.text.trim(),
      "address": addressController.text.trim(),
      "photo": ''
    };

    try {
      if (!myFormKey.currentState!.validate()) {
        return;
      }

      isLoading = true;
      notifyListeners();

      Client? client = await ClientRepository.newClient(data: formUser);

      if (client != null) {
        if (!context.mounted) return;
        DialogHelper.customSnackBar(
            context: context,
            text: 'Client created successfully',
            color: Colors.green);
        clearData();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      if (!context.mounted) return;
      DialogHelper.customSnackBar(
          context: context, text: 'Unexpected error', color: Colors.red);

      return;
    }
  }

  void getCelula(File fileSelected) async {
    image = fileSelected;
  }

  Future<String> convertFile64(File file) async {
    final bytes = File(file.path).readAsBytesSync();
    return "data:image/png;base64,${base64Encode(bytes)}";
  }

  void clearData() {
    emailController.clear();
    firtsNameController.clear();
    lastNameController.clear();
    addressController.clear();
  }

  void fillField({required Client client}) {
    emailController.text = client.email!;
    firtsNameController.text = client.firstname!;
    lastNameController.text = client.lastname!;
    addressController.text = client.address!;
  }
}
