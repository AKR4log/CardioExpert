import 'package:cardio_expert/app/database/service.dart';
import 'package:cardio_expert/localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';
import '../action/helper.dart';
import '../helper/home.dart';

class LipidProfile extends StatefulWidget {
  const LipidProfile({Key key}) : super(key: key);

  @override
  State<LipidProfile> createState() => _LipidProfileState();
}

class _LipidProfileState extends State<LipidProfile> {
  TextEditingController controllerCholesterol;
  TextEditingController controllerLdl;
  TextEditingController controllerHdl;
  TextEditingController controllerTriglycerides;

  @override
  void initState() {
    controllerCholesterol = TextEditingController();
    controllerHdl = TextEditingController();
    controllerLdl = TextEditingController();
    controllerTriglycerides = TextEditingController();
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
          AppLocalizations.of(context).translate('lipid_profile'),
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
                      AppLocalizations.of(context).translate('cholesterol'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerCholesterol,
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
            margin: const EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Text(AppLocalizations.of(context).translate('ldl'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerLdl,
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
            margin: const EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Text(AppLocalizations.of(context).translate('hdl'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerHdl,
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
            margin: const EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Text(
                      AppLocalizations.of(context).translate('triglycerides'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerTriglycerides,
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
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextButton(
                onPressed: () => cloud.createCntrlLipidProfile(
                    context,
                    controllerCholesterol.text.trim(),
                    controllerLdl.text.trim(),
                    controllerHdl.text.trim(),
                    controllerTriglycerides.text.trim()),
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
                  shareLipidProfile(
                      controllerCholesterol.text.trim(),
                      controllerLdl.text.trim(),
                      controllerHdl.text.trim(),
                      controllerTriglycerides.text.trim(),
                      formatted);
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
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HelperPageMobile(
                          uid: "fc9d0f36-f820-4d26-bc1d-0ccbfb55bdc8",
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
                    AppLocalizations.of(context)
                        .translate('what_lipid_profile'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
    controllerCholesterol?.dispose();
    controllerHdl?.dispose();
    controllerLdl?.dispose();
    controllerTriglycerides?.dispose();
    super.dispose();
  }
}
