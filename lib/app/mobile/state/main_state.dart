import 'package:cardio_expert/app/models/hint.dart';
import 'package:cardio_expert/app/models/v2hint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../ui/mobile/connect/connect.dart';
import '../../../ui/mobile/home/home.dart';
import '../../../ui/web/home/home.dart';
import '../../enum.dart';
import '../../models/board.dart';
import '../../models/v2board.dart';
import 'app_state.dart';

class MainStateMobile extends AppStateMobile {
  final String uidBoard;
  final String uidV2Board;
  final String uidHint;
  final String uidV2Hint;

  MainStateMobile(
      {this.uidBoard, this.uidV2Board, this.uidHint, this.uidV2Hint});

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ConfirmationResult confirmationResult;
  User user;
  final CollectionReference boardCall =
      FirebaseFirestore.instance.collection('board');
  final CollectionReference hintCall =
      FirebaseFirestore.instance.collection('hint');

  Future<User> getCurrentUser({BuildContext context}) async {
    try {
      await Firebase.initializeApp();
      loading = true;
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user == null) {
          debugPrint('User is currently signed out!');
          authStatus = AuthStatus.NOT_LOGGED_IN;
          kIsWeb
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePageWeb()))
              : Navigator.of(context).push(MaterialPageRoute(
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

  // Loading all Board
  List<Board> loadBoards(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Board(
        uid: doc.get('uid'),
        name: doc.get('name'),
        name_kz: doc.get('name_kz'),
        date: doc.get('date'),
      );
    }).toList();
  }

  Stream<List<Board>> get getAllBoards {
    return boardCall.snapshots().map(loadBoards);
  }

  // Loading all V2Board
  List<V2Board> loadV2Boards(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return V2Board(
        uid: doc.get('uid'),
        name: doc.get('name'),
        name_kz: doc.get('name_kz'),
        date: doc.get('date'),
        description: doc.get('description'),
        description_kz: doc.get('description_kz'),
        father: doc.get('father'),
      );
    }).toList();
  }

  Stream<List<V2Board>> get getAllV2Boards {
    return boardCall
        .doc(uidBoard)
        .collection('v2board')
        .snapshots()
        .map(loadV2Boards);
  }

  // Loading an V2Board
  V2Board getV2Board(DocumentSnapshot snapshot) {
    return V2Board(
        uid: snapshot.get('uid'),
        name: snapshot.get('name'),
        name_kz: snapshot.get('name_kz'),
        description: snapshot.get('description'),
        description_kz: snapshot.get('description_kz'),
        father: snapshot.get('father'),
        date: snapshot.get('date'));
  }

  Stream<V2Board> get getV2Boards {
    return boardCall
        .doc(uidBoard)
        .collection('v2board')
        .doc(uidV2Board)
        .snapshots()
        .map(getV2Board);
  }

  // Loading all Hint
  List<Hint> loadHints(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Hint(
          uid: doc.get('uid'),
          name: doc.get('name'),
          name_kz: doc.get('name_kz'),
          description: doc.get('description'),
          description_kz: doc.get('description_kz'));
    }).toList();
  }

  Stream<List<Hint>> get getAllHints {
    return hintCall.snapshots().map(loadHints);
  }

  Hint getHint(DocumentSnapshot snapshot) {
    return Hint(
        uid: snapshot.get('uid'),
        name: snapshot.get('name'),
        name_kz: snapshot.get('name_kz'),
        description: snapshot.get('description'),
        description_kz: snapshot.get('description_kz'));
  }

  Stream<Hint> get getHints {
    return hintCall.doc(uidHint).snapshots().map(getHint);
  }
}
