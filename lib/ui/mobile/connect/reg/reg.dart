import 'package:cardio_expert/app/database/firebase.dart';
import 'package:cardio_expert/app/database/service.dart';
import 'package:cardio_expert/localization.dart';
import 'package:cardio_expert/ui/mobile/connect/connect.dart';
import 'package:cardio_expert/ui/mobile/connect/reg/password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  TextEditingController controllerEmail;
  TextEditingController controllerSurname;
  TextEditingController controllerName;
  TextEditingController controllerAge;
  TextEditingController controllerFullNameYourDoctor;
  TextEditingController controllerPhoneNumberYourDoctor;

  @override
  void initState() {
    controllerAge = TextEditingController();
    controllerEmail = TextEditingController();
    controllerFullNameYourDoctor = TextEditingController();
    controllerName = TextEditingController();
    controllerPhoneNumberYourDoctor = TextEditingController();
    controllerSurname = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 36),
                  child: Image.asset('assets/img/welcome.png',
                      height: 200, width: 200),
                ),
                 Text(
                      AppLocalizations.of(context).translate('welcome_title')
,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 19, bottom: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ConnectPage())),
                          child:  Text(AppLocalizations.of(context).translate('login'))),
                    ],
                  ),
                )
              ]),
        ),
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
                onChanged: (val) {
                  // setState(() {
                  //   errorMailLength = false;
                  // });
                },
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppLocalizations.of(context).translate('last_name'),
                  style: const TextStyle(color: Color.fromRGBO(111, 111, 111, 1))),
              TextField(
                controller: controllerSurname,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1)))),
                
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppLocalizations.of(context).translate('first_name'),
                  style: const TextStyle(color: Color.fromRGBO(111, 111, 111, 1))),
              TextField(
                controller: controllerName,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1)))),
                
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppLocalizations.of(context).translate('age'),
                  style: const TextStyle(color: Color.fromRGBO(111, 111, 111, 1))),
              TextField(
                controller: controllerAge,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1)))),
                
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppLocalizations.of(context).translate('full_doctor_name'),
                  style: const TextStyle(color: Color.fromRGBO(111, 111, 111, 1))),
              TextField(
                controller: controllerFullNameYourDoctor,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1)))),
                
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(AppLocalizations.of(context).translate('doctor_number_phone'),
                  style: const TextStyle(color: Color.fromRGBO(111, 111, 111, 1))),
              TextField(
                controller: controllerPhoneNumberYourDoctor,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(66, 76, 109, 1)))),
                
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        TextButton(
            onPressed: () {
              setName(controllerName.text.trim()).whenComplete(() =>
                  setSurname(controllerSurname.text.trim()).whenComplete(() =>
                      setAge(controllerAge.text.trim()).whenComplete(() =>
                          setEmail(controllerEmail.text.trim()).whenComplete(() =>
                              setFullNameDoctor(controllerFullNameYourDoctor.text.trim())
                                  .whenComplete(() =>
                                      setPhoneDoctor(controllerPhoneNumberYourDoctor.text.trim()).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const SetPasswordPage()))))))));
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
            child:  Text(AppLocalizations.of(context).translate('done'),
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
      ])),
    );
  }

  @override
  void dispose() {
    controllerAge?.dispose();
    controllerEmail?.dispose();
    controllerFullNameYourDoctor?.dispose();
    controllerName?.dispose();
    controllerPhoneNumberYourDoctor?.dispose();
    controllerSurname?.dispose();
    super.dispose();
  }
}
