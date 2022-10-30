// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cardio_expert/localization.dart';
import 'package:cardio_expert/main.dart';
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

import 'helper/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLeft = false;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin:
              const EdgeInsets.only(top: 76, bottom: 30, left: 20, right: 20),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLeft = false;
                    });
                  },
                  child: Container(
                    height: 33,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: !isLeft
                            ? const Color.fromRGBO(255, 98, 98, 1)
                            : const Color.fromRGBO(148, 148, 148, 1)),
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context).translate('my_medications'),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLeft = true;
                    });
                  },
                  child: Container(
                    height: 33,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isLeft
                            ? const Color.fromRGBO(255, 98, 98, 1)
                            : const Color.fromRGBO(148, 148, 148, 1)),
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context).translate('self_control'),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
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
                            Flexible(
                                flex: 2,
                                child: Text(
                                    AppLocalizations.of(context).translate(
                                        'weight_control_body_mass_index'),
                                    style: const TextStyle(
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
                            Flexible(
                                flex: 2,
                                child: Text(
                                    AppLocalizations.of(context)
                                        .translate('blood_pressure_monitoring'),
                                    style: const TextStyle(
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
                            Flexible(
                                flex: 2,
                                child: Text(
                                    AppLocalizations.of(context)
                                        .translate('pulse_monitoring'),
                                    style: const TextStyle(
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
                            Flexible(
                                flex: 2,
                                child: Text(
                                    AppLocalizations.of(context)
                                        .translate('control_drunk'),
                                    style: const TextStyle(
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
                            Flexible(
                                flex: 2,
                                child: Text(
                                    AppLocalizations.of(context)
                                        .translate('control_INR'),
                                    style: const TextStyle(
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
                            Flexible(
                                flex: 2,
                                child: Text(
                                    AppLocalizations.of(context)
                                        .translate('lipid_profile'),
                                    style: const TextStyle(
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
                      child: Text(
                          AppLocalizations.of(context).translate('reports'),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
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
                                  const HelperPage())),
                      child: Text(
                          AppLocalizations.of(context)
                              .translate('informational_materials'),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                  myLocale.countryCode.toString() != "KZ"
                      ? TextButton(
                          onPressed: () {
                            Locale newLocale = const Locale('kk', 'KZ');
                            MyApp.setLocale(context, newLocale);
                          },
                          child: const Text("Қазақшаға көш",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue)))
                      : TextButton(
                          onPressed: () {
                            Locale newLocale = const Locale('ru', 'RU');
                            MyApp.setLocale(context, newLocale);
                          },
                          child: const Text("Переключить на русский",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue))),
                  TextButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      child: Text(
                          AppLocalizations.of(context).translate('log_out'),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue))),
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
                        width: 310,
                        height: 400,
                        child: ListView(
                          children: med
                              .map(
                                (e) => Flex(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  direction: Axis.horizontal,
                                  children: [
                                    Flexible(
                                      flex: 6,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18, horizontal: 22),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                                  e['reception_time_1'] !=
                                                              null &&
                                                          e['reception_time_1'] !=
                                                              '' &&
                                                          e['reception_time_2'] !=
                                                              null &&
                                                          e['reception_time_2'] !=
                                                              '' &&
                                                          e['reception_time_3'] !=
                                                              null &&
                                                          e['reception_time_3'] !=
                                                              ''
                                                      ? 'Приём в ${e['reception_time_1']}, в ${e['reception_time_2']}, в ${e['reception_time_3']}'
                                                      : e['reception_time_1'] != null &&
                                                              e['reception_time_1'] !=
                                                                  '' &&
                                                              e['reception_time_2'] !=
                                                                  null &&
                                                              e['reception_time_2'] !=
                                                                  ''
                                                          ? 'Приём в ${e['reception_time_1']}, в ${e['reception_time_2']}'
                                                          : e['reception_time_1'] !=
                                                                      null &&
                                                                  e['reception_time_1'] !=
                                                                      ''
                                                              ? 'Приём в ${e['reception_time_1']}'
                                                              : const SizedBox(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13,
                                                      color: Color.fromRGBO(
                                                          148, 148, 148, 1)),
                                                ),
                                                Text(
                                                  e['name'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  e['dosage'] + ' мг',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                    ),
                                    Flexible(
                                        child: IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(FirebaseAuth
                                                .instance.currentUser.uid)
                                            .collection("medications")
                                            .doc(e['uid'])
                                            .delete()
                                            .whenComplete(() {
                                          setState(() {});
                                        });
                                      },
                                      icon: const Icon(Icons.close),
                                    ))
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      );
                    } else {
                      return const SizedBox(
                          width: 300,
                          height: 400,
                          child: Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator())));
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
                      child: Text(AppLocalizations.of(context).translate('add'),
                          style: const TextStyle(
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
