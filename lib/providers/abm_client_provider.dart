import 'dart:convert';
import 'dart:io';

import 'package:test_tots/screens/home_screen.dart';
import 'package:test_tots/theme/custom_style_theme.dart';

import '../models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:test_tots/modals/dialog_modal.dart';
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
  Client? updateClient;
  File? image;

  Future<void> onSaved({required BuildContext context}) async {
    Map<String, dynamic> formUser = {
      "id": updateClient?.id,
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

      Client? client = await ClientRepository.createClient(data: formUser);

      if (client != null) {
        if (!context.mounted) return;
        DialogModal.customSnackBar(
            context: context,
            text: (updateClient == null)
                ? 'Client created successfully'
                : 'Client updated successfully',
            color: CustomStylesTheme.greenColor);
        clearData();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      if (!context.mounted) return;
      DialogModal.customSnackBar(
          context: context,
          text: 'Unexpected error',
          color: CustomStylesTheme.redColor);

      return;
    }
  }

  void getCelula(File fileSelected) async {
    image = fileSelected;
  }

  /// Función para convertir un file en string base 64
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

  void fillField({Client? client}) {
    updateClient = client;
    emailController.text = client?.email ?? '';
    firtsNameController.text = client?.firstname ?? '';
    lastNameController.text = client?.lastname ?? '';
    addressController.text = client?.address ?? '';
  }
}
