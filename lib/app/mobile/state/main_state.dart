import 'package:cardio_expert/app/mobile/state/app_state.dart';
import 'package:cardio_expert/ui/mobile/connect/connect.dart';
import 'package:cardio_expert/ui/mobile/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../enum.dart';

class MainStateMobile extends AppStateMobile {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ConfirmationResult confirmationResult;
  User user;

  Future<User> getCurrentUser({BuildContext context}) async {
    try {
      await Firebase.initializeApp();
      loading = true;
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user == null) {
          debugPrint('User is currently signed out!');
          authStatus = AuthStatus.NOT_LOGGED_IN;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const ConnectPage()));
        } else {
          debugPrint('User is signed in!');
          authStatus = AuthStatus.LOGGED_IN;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()));
        }
      });
      loading = false;
      return user;
    } catch (error) {
      loading = false;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }
}
