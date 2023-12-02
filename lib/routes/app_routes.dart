// Crea el Map de rutas de la app.
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static final Map<String, Widget Function(BuildContext)> routes = {
    LoginScreen.routeName: (_) => const LoginScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    AbmClientScreen.routeName: (_) => const AbmClientScreen()
  };
}
