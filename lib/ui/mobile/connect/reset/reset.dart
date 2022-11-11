// ignore_for_file: non_constant_identifier_names

import 'package:cardio_expert/localization.dart';
import 'package:cardio_expert/ui/mobile/connect/reg/reg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController controllerEmail;
  String error = "";
  bool RESET_PASSWORD = false;

  @override
  void initState() {
    controllerEmail = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context).translate('recover_password'),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(height: 23),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email',
                  style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1))),
              TextField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1)))),
              ),
              RESET_PASSWORD
                  ? Text(
                      AppLocalizations.of(context).translate('recover_is_good'))
                  : const SizedBox(),
              error ==
                      "[firebase_auth/invalid-email] The email address is badly formatted."
                  ? Text(
                      "${AppLocalizations.of(context).translate('recover_is_bad')} The email address is badly formatted.")
                  : const SizedBox(),
              error ==
                      "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted."
                  ? Text(
                      "${AppLocalizations.of(context).translate('recover_is_bad')} There is no user record corresponding to this identifier. The user may have been deleted.")
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 25),
        TextButton(
            onPressed: () {
              cloud
                  .resetPassword(email: controllerEmail.text.trim())
                  .then((value) {
                if (value.toString() == "RESET_PASSWORD") {
                  RESET_PASSWORD = true;
                }
                setState(() {
                  error = value.toString();
                });
              });
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(255, 98, 98, 1)),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 55)),
            ),
            child: Text(
                AppLocalizations.of(context).translate('recover_password'),
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
      ])),
    );
  }
}
