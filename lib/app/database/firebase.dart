// ignore_for_file: unused_field, missing_return, avoid_print, non_constant_identifier_names

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

  Future<void> createNewUser(
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
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
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
        'date': DateTime.now()
      }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())));
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
}
