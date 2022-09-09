import 'package:cardio_expert/ui/mobile/connect/reg/reg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/database/firebase.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  TextEditingController controllerEmail;
  TextEditingController controllerPassword;
  String error = '';

  @override
  void initState() {
    controllerEmail = TextEditingController();
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
                Padding(
                  padding: const EdgeInsets.only(top: 19, bottom: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // TextButton(onPressed: () {}, child: const Text('Войти')),
                      TextButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const RegPage())),
                          child: const Text('Зарегистрироваться')),
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
              const Text('Email:',
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
              const Text('Пароль:',
                  style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1))),
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
        error != ''
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red[400], fontSize: 12),
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 25),
        TextButton(
            onPressed: () {
              cloud
                  .signInUser(context, controllerEmail.text.trim(),
                      controllerPassword.text.trim())
                  .then((value) {
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
            child: const Text('Войти',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
      ])),
    );
  }
}
