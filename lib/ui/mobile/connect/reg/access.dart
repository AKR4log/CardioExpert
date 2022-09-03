// ignore_for_file: use_build_context_synchronously

import 'package:cardio_expert/app/database/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';

class Access extends StatefulWidget {
  const Access({Key key}) : super(key: key);

  @override
  State<Access> createState() => _AccessState();
}

class _AccessState extends State<Access> {
  TextEditingController controllerPassword;

  @override
  void initState() {
    controllerPassword = TextEditingController();
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
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 19),
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
                const Text(
                  'Добро пожаловать !',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ]),
        ),
        const SizedBox(height: 23),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Придумайте пароль:',
                  style: TextStyle(
                      color: Color.fromRGBO(111, 111, 111, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              TextField(
                controller: controllerPassword,
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.text,
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
        const SizedBox(height: 35),
        TextButton(
            onPressed: () async {
              var password = await getPassword();
              if (password != controllerPassword.text.trim()) {}
              var name = await getName();
              var surname = await getSurname();
              var age = await getAge();
              var nameDoctor = await getFullNameDoctor();
              var phoneDoctor = await getPhoneDoctor();
              var email = await getEmail();
              cloud.createNewUser(context, password, email,
                  name: name,
                  surname: surname,
                  age: age,
                  doctorName: nameDoctor,
                  doctorPhone: phoneDoctor);
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
            child: const Text('Далее',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
      ])),
    );
  }

  @override
  void dispose() {
    controllerPassword?.dispose();
    super.dispose();
  }
}
