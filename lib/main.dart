import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app/database/firebase.dart';
import 'app/mobile/state/app_state.dart';
import 'app/mobile/state/main_state.dart';
import 'app/routes/routes.dart';
import 'firebase_options.dart';
import 'ui/mobile/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? MultiProvider(
            providers: [
                ChangeNotifierProvider<AppStateMobile>(
                    create: (_) => AppStateMobile()),
                ChangeNotifierProvider<Cloud>(create: (_) => Cloud()),
                ChangeNotifierProvider<MainStateMobile>(
                    create: (_) => MainStateMobile()),
              ],
            child: MaterialApp(
              shortcuts: {
                LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
              },
              initialRoute: '/splash',
              routes: {
                '/splash': (context) => const SplashPage(),
              },
              debugShowCheckedModeBanner: false,
              title: 'CardioExpert',
            ))
        : MultiProvider(
            providers: [
              ChangeNotifierProvider<AppStateMobile>(
                  create: (_) => AppStateMobile()),
              ChangeNotifierProvider<Cloud>(create: (_) => Cloud()),
              ChangeNotifierProvider<MainStateMobile>(
                  create: (_) => MainStateMobile()),
            ],
            child: MaterialApp(
              theme: ThemeData(fontFamily: 'Montserrat'),
              title: 'CardioExpert',
              debugShowCheckedModeBanner: false,
              routes: Routes.route(),
              onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
              initialRoute: "SplashPage",
            ),
          );
  }
}
