import 'package:cardio_expert/app/database/service.dart';
import 'package:cardio_expert/localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';
import '../action/helper.dart';
import '../helper/home.dart';

class ControlPulse extends StatefulWidget {
  const ControlPulse({Key key}) : super(key: key);

  @override
  State<ControlPulse> createState() => _ControlPulseState();
}

class _ControlPulseState extends State<ControlPulse> {
  TextEditingController controllerPulse = TextEditingController();

  @override
  void initState() {
    controllerPulse = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.black),
        title: Text(
          AppLocalizations.of(context).translate('pulse_monitoring'),
          textAlign: TextAlign.center,
          style: const TextStyle(
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
                  child: Text(
                      AppLocalizations.of(context)
                          .translate('enter_your_heart_rate'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerPulse,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: '0',
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
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HelperPageMobile(
                          uid: "3b093b46-e76b-4626-b491-ef91003d45ce",
                        ))),
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
                child: Text(
                    AppLocalizations.of(context).translate('how_measure_pulse'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HelperPageMobile(
                          uid: "ca6b13fc-073a-4b88-ba9b-35043c736b39",
                        ))),
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
                child: Text(
                    AppLocalizations.of(context).translate('what_pulse'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextButton(
                onPressed: () => cloud.createCntrlPulse(
                    context, controllerPulse.text.trim()),
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
                    AppLocalizations.of(context).translate('generate_report'),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextButton(
                onPressed: () {
                  final DateTime now = DateTime.now();
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formatted = formatter.format(now);
                  sharePulse(controllerPulse.text.trim(), formatted);
                },
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
                child: Text(
                    AppLocalizations.of(context)
                        .translate('send_report_doctor'),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
        ]),
      )),
    );
  }
}
