// ignore_for_file: unused_field, missing_return, avoid_print, non_constant_identifier_names, unused_local_variable

import 'package:cardio_expert/app/database/service.dart';
import 'package:cardio_expert/ui/mobile/connect/welcome.dart';
import 'package:cardio_expert/ui/mobile/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../enum.dart';
import '../mobile/state/app_state.dart';

class Cloud extends AppStateMobile {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ConfirmationResult confirmationResult;
  User user;
  CollectionReference refU = FirebaseFirestore.instance.collection("users");
  CollectionReference refB = FirebaseFirestore.instance.collection("board");
  CollectionReference refH = FirebaseFirestore.instance.collection("hint");

  Future<String> createNewUser(
      BuildContext context, String password, String email,
      {String name,
      String surname,
      String age,
      String doctorName,
      String doctorPhone}) async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      refU.doc(userCredential.user.uid).set({
        'name': name,
        'surname': surname,
        'age': age,
        'doctorName': doctorName,
        'doctorPhone': doctorPhone,
        'uid': userCredential.user.uid,
        'email': email
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const WelcomePage())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Предоставленный пароль слишком слаб.';
      } else if (e.code == 'email-already-in-use') {
        return 'Учетная запись для этого электронного письма уже существует.';
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> signInUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user.uid != '') {
        return Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Пользователь для этого письма не найден.';
      } else if (e.code == 'wrong-password') {
        return 'Неверный пароль, указанный для этого пользователя.';
      }
    }
  }

  Future<void> createCntrlWeight(
      BuildContext context, String weight, String height) async {
    await Firebase.initializeApp();
    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_weight')
          .doc(const Uuid().v4())
          .set({
        'weight': weight,
        'height': height,
        'date': DateTime.now().toString()
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ints() async {
    await Firebase.initializeApp();
    // FirebaseAuth.instance.signOut();
    var weightW = 'none',
        heightW = 'none',
        upperB = 'none',
        lowerB = 'none',
        pulse = 'none',
        dateP = 'none',
        mno = 'none',
        cholesterolL = 'none',
        ldlL = 'none',
        hdlL = 'none',
        triglyceridesL = 'none',
        n0612highlighted = 'none',
        n1218highlighted = 'none',
        n1800highlighted = 'none',
        n0006highlighted = 'none',
        n0612drunk = 'none',
        n1218drunk = 'none',
        n1800drunk = 'none',
        n0006drunk = 'none';

    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_weight')
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          weightW = value.docs.last.get('weight');
          heightW = value.docs.last.get('height');
        }
        refU
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection('control_blood')
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            upperB = value.docs.last.get('upper');
            lowerB = value.docs.last.get('lower');
          }
          refU
              .doc(FirebaseAuth.instance.currentUser.uid)
              .collection('control_pulse')
              .get()
              .then((value) {
            if (value.docs.isNotEmpty) {
              pulse = value.docs.last.get('pulse');
            }
            refU
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('control_mno')
                .get()
                .then((value) {
              if (value.docs.isNotEmpty) {
                mno = value.docs.last.get('mno');
              }
              refU
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .collection('lipid_profile')
                  .get()
                  .then((value) {
                if (value.docs.isNotEmpty) {
                  cholesterolL = value.docs.last.get('cholesterol');
                  ldlL = value.docs.last.get('ldl');
                  hdlL = value.docs.last.get('hdl');
                  triglyceridesL = value.docs.last.get('triglycerides');
                }
                refU
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .collection('drunk')
                    .get()
                    .then((value) {
                  if (value.docs.isNotEmpty) {
                    n0612highlighted = value.docs.last.get('n0612highlighted');
                    n1218highlighted = value.docs.last.get('n1218highlighted');
                    n1800highlighted = value.docs.last.get('n1800highlighted');
                    n0006highlighted = value.docs.last.get('n0006highlighted');
                    n0612drunk = value.docs.last.get('n0612drunk');
                    n1218drunk = value.docs.last.get('n1218drunk');
                    n1800drunk = value.docs.last.get('n1800drunk');
                    n0006drunk = value.docs.last.get('n0006drunk');
                  }

                  return shareReport(
                      pulse: pulse,
                      mno: mno,
                      ldl: ldlL,
                      hdl: hdlL,
                      triglycerides: triglyceridesL,
                      cholesterol: cholesterolL,
                      upper: upperB,
                      lower: lowerB,
                      weight: weightW,
                      height: heightW,
                      d0006: n0006drunk,
                      h0006: n0006highlighted,
                      d0612: n0612drunk,
                      h0612: n0612highlighted,
                      d1218: n1218drunk,
                      h1218: n1218highlighted,
                      d1800: n1800drunk,
                      h1800: n1800highlighted);
                });
              });
            });
          });
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createCntrlBlood(
      BuildContext context, String upper, String lower) async {
    await Firebase.initializeApp();
    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_blood')
          .doc(const Uuid().v4())
          .set({
        'upper': upper,
        'lower': lower,
        'date': DateTime.now()
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createCntrlPulse(BuildContext context, String pulse) async {
    await Firebase.initializeApp();
    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_pulse')
          .doc(const Uuid().v4())
          .set({'pulse': pulse, 'date': DateTime.now()}).whenComplete(() =>
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createCntrlMno(BuildContext context, String mno) async {
    await Firebase.initializeApp();
    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_mno')
          .doc(const Uuid().v4())
          .set({'mno': mno, 'date': DateTime.now()}).whenComplete(() =>
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createCntrlLipidProfile(BuildContext context, String cholesterol,
      String ldl, String hdl, String triglycerides) async {
    await Firebase.initializeApp();
    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('lipid_profile')
          .doc(const Uuid().v4())
          .set({
        'cholesterol': cholesterol,
        'ldl': ldl,
        'hdl': hdl,
        'triglycerides': triglycerides,
        'date': DateTime.now()
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createCntrlDrunk(
      BuildContext context,
      String n0612highlighted,
      String n1218highlighted,
      String n1800highlighted,
      String n0006highlighted,
      String n0612drunk,
      String n1218drunk,
      String n1800drunk,
      String n0006drunk) async {
    await Firebase.initializeApp();
    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('drunk')
          .doc(const Uuid().v4())
          .set({
        'n0612highlighted': n0612highlighted,
        'n1218highlighted': n1218highlighted,
        'n1800highlighted': n1800highlighted,
        'n0006highlighted': n0006highlighted,
        'n0612drunk': n0612drunk,
        'n1218drunk': n1218drunk,
        'n1800drunk': n1800drunk,
        'n0006drunk': n0006drunk,
        'date': DateTime.now()
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createMedication(BuildContext context, String reception_time,
      String name, String dosage) async {
    await Firebase.initializeApp();
    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('medications')
          .doc(const Uuid().v4())
          .set({
        'reception_time': reception_time,
        'name': name,
        'dosage': dosage,
        'date': DateTime.now()
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> createBoard(BuildContext context, String name) async {
    await Firebase.initializeApp();
    try {
      var uid = const Uuid().v4();
      refB
          .doc(uid)
          .set({'name': name, 'uid': uid, 'date': DateTime.now().toString()});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> createV2Board(BuildContext context, String fatherUid,
      String name, String description) async {
    await Firebase.initializeApp();
    try {
      var uid = const Uuid().v4();
      refB.doc(fatherUid).collection('v2board').doc(uid).set({
        'name': name,
        'description': description,
        'father': fatherUid,
        'uid': uid,
        'date': DateTime.now().toString()
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> updateV2Board(BuildContext context, String fatherUid,
      String uid, String name, String description) async {
    await Firebase.initializeApp();
    try {
      refB
          .doc(fatherUid)
          .collection('v2board')
          .doc(uid)
          .update({'name': name, 'description': description});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> createHint(
      BuildContext context, String name, String description) async {
    await Firebase.initializeApp();
    try {
      var uid = const Uuid().v4();
      refH.doc(uid).set({'name': name, 'description': description, 'uid': uid});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> updateHint(
      BuildContext context, String uid, String name, String description) async {
    await Firebase.initializeApp();
    try {
      refH.doc(uid).update({'name': name, 'description': description});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
