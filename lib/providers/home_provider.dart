import 'package:flutter/material.dart';

import 'package:test_tots/repository/client_repository.dart';

class HomeProvider with ChangeNotifier {
  bool initialLoading = true;
  Future<void> getClients() async {
    try {
      initialLoading = true;
      var resp = await ClientRepository.clients();

      initialLoading = false;
      notifyListeners();
    } catch (e) {
      initialLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
