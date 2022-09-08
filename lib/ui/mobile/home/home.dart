import 'package:cardio_expert/ui/mobile/home/action/tablet.dart';
import 'package:cardio_expert/ui/mobile/home/control/Blood_pressure.dart';
import 'package:cardio_expert/ui/mobile/home/control/drunk_excreted_liquid.dart';
import 'package:cardio_expert/ui/mobile/home/control/lipid_profile.dart';
import 'package:cardio_expert/ui/mobile/home/control/mno.dart';
import 'package:cardio_expert/ui/mobile/home/control/pulse.dart';
import 'package:cardio_expert/ui/mobile/home/control/weight.dart';
import 'package:cardio_expert/ui/mobile/home/reports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 76, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLeft = true;
                  });
                },
                child: Container(
                  height: 33,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10)),
                      color: isLeft
                          ? const Color.fromRGBO(255, 98, 98, 1)
                          : const Color.fromRGBO(148, 148, 148, 1)),
                  child: const Center(
                      child: Text(
                    'Дневник самоконтроля',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLeft = false;
                  });
                },
                child: Container(
                  height: 33,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(10)),
                      color: !isLeft
                          ? const Color.fromRGBO(255, 98, 98, 1)
                          : const Color.fromRGBO(148, 148, 148, 1)),
                  child: const Center(
                      child: Text(
                    'Мои препараты',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
        isLeft
            ? Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(242, 242, 242, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 22)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ControlWeight())),
                      child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                                flex: 2,
                                child: Text('Контроль веса\nИндекса массы тела',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black))),
                            Flexible(
                                child: Image.asset('assets/img/radial.png'))
                          ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(242, 242, 242, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 22)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ControlBlood())),
                      child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                                flex: 2,
                                child: Text('Контроль артериального давления',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black))),
                            Flexible(
                                child: Image.asset('assets/img/radial.png'))
                          ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(242, 242, 242, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 22)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ControlPulse())),
                      child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                                flex: 2,
                                child: Text('Контроль пульса',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black))),
                            Flexible(
                                child: Image.asset('assets/img/radial.png'))
                          ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(242, 242, 242, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 22)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ControlDrunk())),
                      child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                                flex: 2,
                                child: Text(
                                    'Контроль выпитой и выделенной жидкости',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black))),
                            Flexible(
                                child: Image.asset('assets/img/radial.png'))
                          ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(242, 242, 242, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 22)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ControlMno())),
                      child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                                flex: 2,
                                child: Text('Контроль МНО при приёме Варфарина',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black))),
                            Flexible(
                                child: Image.asset('assets/img/radial.png'))
                          ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(242, 242, 242, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 22)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LipidProfile())),
                      child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                                flex: 2,
                                child: Text('Липидный профиль',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black))),
                            Flexible(
                                child: Image.asset('assets/img/radial.png'))
                          ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(242, 242, 242, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 22)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ReportsPage())),
                      child: const Text('Отчёты',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                ],
              )
            : Column(children: [
                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser.uid)
                      .collection('medications')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List med = snapshot.data.docs;
                      return SizedBox(
                        width: 300,
                        height: 400,
                        child: ListView(
                          children: med
                              .map(
                                (e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 22),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromRGBO(
                                          242, 242, 242, 1),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              229, 231, 235, 1))),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Приём в ' + e['reception_time'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    148, 148, 148, 1)),
                                          ),
                                          Text(
                                            e['name'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            e['dosage'] + ' мг',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    255, 98, 98, 1)),
                                          ),
                                        ],
                                      )),
                                      Flexible(
                                          child: Image.asset(
                                              'assets/img/tablet.png'))
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    } else {
                      return const SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AddTablet())),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 98, 98, 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 28)),
                      ),
                      child: const Text('Добавить',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))),
                ),
              ]),
        const SizedBox(height: 40)
      ])),
    );
  }
}
