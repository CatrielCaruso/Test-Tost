import 'package:flutter/material.dart';
import 'package:test_tots/modals/dialog_modal.dart';

import 'package:test_tots/models/client_model.dart';
import 'package:test_tots/repository/client_repository.dart';
import 'package:test_tots/screens/abm_client_screen.dart';
import 'package:test_tots/theme/custom_style_theme.dart';

class HomeProvider with ChangeNotifier {
  FocusNode focusNode = FocusNode();
  bool initialLoading = true;
  int pageNro = 1;
  List<Client> clients = [];
  List<Client> clientAux = [];
  List<Client> searchClients = [];
  int startIndex = 0;
  int endIndex = 5;

  Future<void> initFetch() async {
    try {
      /// Limpios las variables para volver a traer los primero 5.
      clearVariable();
      await getClients();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getClients() async {
    try {
      initialLoading = true;

      clients = await ClientRepository.clients();
      fillArray();
      initialLoading = false;
      notifyListeners();
    } catch (e) {
      initialLoading = false;
      notifyListeners();

      rethrow;
    }
  }

  Future<void> onDelete(
      {required BuildContext context, required int idClient}) async {
    try {
      initialLoading = true;
      notifyListeners();

      bool resp = await ClientRepository.deleteClient(idClient: idClient);

      /// Limpios las variables para volver a traer los primero 5.
      clearVariable();
      clients = await ClientRepository.clients();
      fillArray();

      initialLoading = false;
      notifyListeners();
      if (!context.mounted) return;
      DialogModal.customSnackBar(
          context: context,
          text: (resp)
              ? 'Client deleted'
              : 'The client could not be deleted. Please try again later.',
          color: CustomStylesTheme.redColor);
    } catch (e) {
      initialLoading = false;
      notifyListeners();

      DialogModal.customSnackBar(
          context: context, text: 'Unexpected error', color: Colors.red);
      rethrow;
    }
  }

  void clearVariable() {
    startIndex = 0;
    endIndex = 5;
    clients = [];
    clientAux = [];
  }

  /// Voy llenando el array que se muestra en el home de a 5 clientes.
  void fillArray() {
    clientAux = [...clients.sublist(0, endIndex)];

    if (clients.length <= endIndex) return;
    if (clients.length >= (endIndex + 5)) {
      endIndex = endIndex + 5;
    } else {
      endIndex = clients.length;
    }

    searchClients = [...clientAux];
  }

  /// Cargo el array
  Future<void> onLoadClints() async {
    fillArray();
    notifyListeners();
  }

  /// Esta función busca los clientes basado en el string que se ingresando.
  void onSearchClient(String text) {
    searchClients.clear();
    if (text.isEmpty) {
      searchClients = [...clients];
      notifyListeners();
      return;
    }

    if (clients.isEmpty) return;
    searchClients = clients
        .where((element) => element.fullName
            .toString()
            .toLowerCase()
            .contains(text.toLowerCase()))
        .toList()
        .take(5)
        .toList();
    notifyListeners();
  }

  void goToAbmClient({required BuildContext context}) {
    Navigator.pushNamed(context, AbmClientScreen.routeName);
  }

  void goToAbmClientUpdate(
      {required BuildContext context, required Client client}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AbmClientScreen(
                client: client,
              )),
    );
  }
}
