import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app/routes/routes.dart';
import 'firebase_options.dart';

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
                // ChangeNotifierProvider<AppState>(create: (_) => AppState()),
                // ChangeNotifierProvider<CloudFirestore>(
                //     create: (_) => CloudFirestore()),
                // ChangeNotifierProvider<FeedState>(create: (_) => FeedState()),
              ],
            child: MaterialApp(
              shortcuts: {
                LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
              },
              initialRoute: '/splash',
              // routes: {
              //   // '/splash': (context) => const SplashPage(),
              //   // '/feed': (context) => const Feed(),
              //   // '/home': (context) => const MainScreen(),
              // },
              debugShowCheckedModeBanner: false,
              title: 'Case Clever',
            ))
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: Routes.route(),
            onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
            initialRoute: "SplashPage",
          );
  }
}
