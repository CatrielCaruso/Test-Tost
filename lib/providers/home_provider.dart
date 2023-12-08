import 'package:flutter/material.dart';
import 'package:test_tots/models/client_model.dart';

import 'package:test_tots/repository/client_repository.dart';
import 'package:test_tots/screens/abm_client_screen.dart';

class HomeProvider with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode focusNode = FocusNode();
  bool initialLoading = true;
  int pageNro = 1;
  List<Client> clients = [];
  List<Client> clientAux = [];
  List<Client> searchClients = [];
  int startIndex = 0;
  int endIndex = 5;
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

  Future<void> onLoadClints() async {
    fillArray();

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
