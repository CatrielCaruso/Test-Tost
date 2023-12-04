import 'package:flutter/material.dart';
import 'package:test_tots/models/client_model.dart';

import 'package:test_tots/repository/client_repository.dart';

class HomeProvider with ChangeNotifier {
  FocusNode focusNode = FocusNode();
  bool initialLoading = true;
  int pageNro = 1;
  List<Client> clients = [];
  List<Client> searchClients = [];
  Future<void> getClients({required int page}) async {
    try {
      initialLoading = true;
      var resp = await ClientRepository.clients(page: page);

      clients.addAll(resp);
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
    pageNro++;
    await getClients(page: pageNro);
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
        .toList();
    notifyListeners();
  }
}
