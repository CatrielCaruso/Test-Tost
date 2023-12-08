import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:test_tots/core/preference.dart';
import 'package:test_tots/providers/providers.dart';
import 'package:test_tots/routes/app_routes.dart';
import 'package:test_tots/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AbmClientProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? widget) => MediaQuery(
          data: MediaQuery.of(context) // Override device text scale factor
              .copyWith(textScaleFactor: 1, devicePixelRatio: 1),
          child: widget!,
        ),
        theme: AppTheme.getTheme(),
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
