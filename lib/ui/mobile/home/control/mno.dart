import 'package:cardio_expert/app/database/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';
import '../helper/home.dart';

class ControlMno extends StatefulWidget {
  const ControlMno({Key key}) : super(key: key);

  @override
  State<ControlMno> createState() => _ControlMnoState();
}

class _ControlMnoState extends State<ControlMno> {
  TextEditingController controllerMno = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerMno = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Контроль МНО при\nприёме Варфарина',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Text('Сдали МНО, введите ваш показатель:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerMno,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: '123',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black54),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(229, 231, 235, 1))),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextButton(
                onPressed: () =>
                    cloud.createCntrlMno(context, controllerMno.text.trim()),
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
                child: const Text('Сформировать отчёт',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextButton(
                onPressed: () => shareMno(controllerMno.text.trim()),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(148, 148, 148, 1)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 55)),
                ),
                child: const Text('Отправить отчёт врачу',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HelperPage())),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(148, 148, 148, 1)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 55)),
                ),
                child: const Text(
                    'Что такое МНО и почему так важно его контролировать',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
        ]),
      )),
    );
  }

  @override
  void dispose() {
    controllerMno?.dispose();
    super.dispose();
  }
}
