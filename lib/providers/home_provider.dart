import 'package:flutter/material.dart';
import 'package:test_tots/models/client_model.dart';

import 'package:test_tots/repository/client_repository.dart';
import 'package:test_tots/screens/abm_client_screen.dart';

class HomeProvider with ChangeNotifier {
  FocusNode focusNode = FocusNode();
  bool initialLoading = true;
  int pageNro = 1;
  List<Client> clients = [];
  List<Client> searchClients = [];
  Future<void> getClients() async {
    try {
      initialLoading = true;

      clients = await ClientRepository.clients();

      searchClients = [...clients];
      initialLoading = false;
      notifyListeners();
    } catch (e) {
      initialLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> onLoadClints() async {
    initialLoading = true;
    notifyListeners();

    await getClients();

    initialLoading = false;
    notifyListeners();
  }

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
}
