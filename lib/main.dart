import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:test_tots/core/preference.dart';
import 'package:test_tots/providers/providers.dart';
import 'package:test_tots/routes/app_routes.dart';
import 'package:test_tots/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await dotenv.load(fileName: "envs/.env");
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
        theme: ThemeData(useMaterial3: false),
        title: 'Material App',
        initialRoute: (Preferences.token != '')
            ? HomeScreen.routeName
            : AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
