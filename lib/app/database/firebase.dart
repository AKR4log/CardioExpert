// ignore_for_file: unused_field, missing_return, avoid_print, non_constant_identifier_names, unused_local_variable

import 'package:cardio_expert/app/database/service.dart';
import 'package:cardio_expert/ui/mobile/connect/welcome.dart';
import 'package:cardio_expert/ui/mobile/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      setEmail(email);
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

  Future<String> resetPassword({String email}) async {
    return await _firebaseAuth
        .sendPasswordResetEmail(email: email)
        .then((value) {
      return 'RESET_PASSWORD';
    }).catchError((e) {
      return e.toString();
    });
  }

  Future<String> signInUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setEmail(email);
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
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_weight')
          .doc(const Uuid().v4())
          .set({
        'weight': weight,
        'height': height,
        'date': formatted
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
        n0006drunk = 'none',
        dateW = 'none',
        dateP = 'none',
        dateM = 'none',
        dateL = 'none',
        dateB = 'none',
        dateD = 'none';

    try {
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_weight')
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          weightW = value.docs.last.get('weight');
          heightW = value.docs.last.get('height');
          dateW = value.docs.last.get('date');
        }
        refU
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection('control_blood')
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            upperB = value.docs.last.get('upper');
            lowerB = value.docs.last.get('lower');
            dateB = value.docs.last.get('date');
          }
          refU
              .doc(FirebaseAuth.instance.currentUser.uid)
              .collection('control_pulse')
              .get()
              .then((value) {
            if (value.docs.isNotEmpty) {
              pulse = value.docs.last.get('pulse');
              dateP = value.docs.last.get('date');
            }
            refU
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('control_mno')
                .get()
                .then((value) {
              if (value.docs.isNotEmpty) {
                mno = value.docs.last.get('mno');
                dateM = value.docs.last.get('date');
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
                  dateL = value.docs.last.get('date');
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
                    dateD = value.docs.last.get('date');
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
                      h1800: n1800highlighted,
                      dateB: dateB,
                      dateD: dateD,
                      dateL: dateL,
                      dateM: dateM,
                      dateP: dateP,
                      dateW: dateW);
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
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_blood')
          .doc(const Uuid().v4())
          .set({
        'upper': upper,
        'lower': lower,
        'date': formatted
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createCntrlPulse(BuildContext context, String pulse) async {
    await Firebase.initializeApp();
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);

      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_pulse')
          .doc(const Uuid().v4())
          .set({'pulse': pulse, 'date': formatted}).whenComplete(() =>
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createCntrlMno(BuildContext context, String mno) async {
    await Firebase.initializeApp();
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('control_mno')
          .doc(const Uuid().v4())
          .set({'mno': mno, 'date': formatted}).whenComplete(() =>
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
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('lipid_profile')
          .doc(const Uuid().v4())
          .set({
        'cholesterol': cholesterol,
        'ldl': ldl,
        'hdl': hdl,
        'triglycerides': triglycerides,
        'date': formatted
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
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
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
        'date': formatted
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createMedication(
      BuildContext context,
      String reception_time1,
      String reception_time2,
      String reception_time3,
      String name,
      String dosage,
      String period) async {
    await Firebase.initializeApp();
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      var uid = const Uuid().v4();
      refU
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('medications')
          .doc(uid)
          .set({
        'reception_time_1': reception_time1,
        'reception_time_2': reception_time2 != '' ? reception_time2 : null,
        'reception_time_3': reception_time3 != '' ? reception_time3 : null,
        'period': period,
        'name': name,
        'uid': uid,
        'dosage': dosage,
        'date': formatted
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> createBoard(
      BuildContext context, String name, String name_kz) async {
    await Firebase.initializeApp();
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      var uid = const Uuid().v4();
      refB.doc(uid).set(
          {'name': name, 'name_kz': name_kz, 'uid': uid, 'date': formatted});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> createV2Board(
      BuildContext context,
      String fatherUid,
      String name,
      String name_kz,
      String description,
      String description_kz) async {
    await Firebase.initializeApp();
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      var uid = const Uuid().v4();
      refB.doc(fatherUid).collection('v2board').doc(uid).set({
        'name': name,
        'description': description,
        'name_kz': name_kz,
        'description_kz': description_kz,
        'father': fatherUid,
        'uid': uid,
        'date': formatted
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
