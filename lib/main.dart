import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app/database/firebase.dart';
import 'app/database/service.dart';
import 'app/mobile/state/app_state.dart';
import 'app/mobile/state/main_state.dart';
import 'app/routes/routes.dart';
import 'firebase_options.dart';
import 'localization.dart';
import 'ui/mobile/splash.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user != null) {
      Timer.periodic(const Duration(seconds: 5), (_) async {
        await getEmail().then((value) {
          if (value != null && value != '') {
            FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('medications')
                .get()
                .then((value) async {
              List<String> list = [];
              for (var element in value.docs) {
                if (element['reception_time_1'].toString() != 'null') {
                  list.add(element['reception_time_1'].toString());
                }
                if (element['reception_time_2'].toString() != 'null') {
                  list.add(element['reception_time_2'].toString());
                }
                if (element['reception_time_3'].toString() != 'null') {
                  list.add(element['reception_time_3'].toString());
                }
              }
              await setTimeMed(list);
              await getTimeMed().then((value) {
                debugPrint(value.toString());
                for (var e in value) {
                  var hour = DateTime.now().hour.toString();
                  if (hour.length == 1) {
                    hour = '0$hour';
                  }
                  var minute = DateTime.now().minute;
                  if ("$hour:$minute" == e.toString()) {
                    flutterLocalNotificationsPlugin.show(
                      DateTime.now().hour.hashCode,
                      'Новое уведомление',
                      "Пора принять таблетки",
                      const NotificationDetails(
                        android: AndroidNotificationDetails(
                          'cardio_expert',
                          'com.akr4log.cardio_expert',
                          icon: 'mini_logo',
                          priority: Priority.high,
                        ),
                      ),
                    );
                  }
                }
              });
            });
          }
        });
      });
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.changeLanguage(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

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
              supportedLocales: const [Locale("ru", "RU"), Locale("kk", "KZ")],
              locale: _locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocates) {
                for (var supportedLocale in supportedLocates) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocates.first;
              },
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
              supportedLocales: const [Locale("ru", "RU"), Locale("kk", "KZ")],
              locale: _locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocates) {
                for (var supportedLocale in supportedLocates) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocates.first;
              },
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
