import 'package:cardio_expert/app/database/service.dart';
import 'package:cardio_expert/ui/mobile/home/action/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';
import '../helper/home.dart';

class ControlWeight extends StatefulWidget {
  const ControlWeight({Key key}) : super(key: key);

  @override
  State<ControlWeight> createState() => _ControlWeightState();
}

class _ControlWeightState extends State<ControlWeight> {
  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerHeight = TextEditingController();
  double imt = 0;

  @override
  void initState() {
    controllerHeight = TextEditingController();
    controllerWeight = TextEditingController();
    super.initState();
  }

  imtFun() {
    return 12 / (50 * 50);
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
          'Контроль веса\nИндекса массы тела',
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
                  child: const Text('Введите вес (в килограммах):',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerWeight,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                  keyboardType: TextInputType.number,
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
                  onChanged: (val) {
                    int weight = int.parse(val);
                    int height = int.parse(controllerHeight.text);

                    setState(() {
                      imt = weight / (height * height);
                    });
                  },
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
                  child: const Text('Введите рост (в метрах):',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerHeight,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                  keyboardType: TextInputType.number,
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
                  onChanged: (val) {
                    int height = int.parse(val);
                    int weight = int.parse(controllerWeight.text);

                    setState(() {
                      imt = weight / (height * height);
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 34),
            child: Center(
              child: Column(children: [
                const Text(
                  'Ваш индекс массы\nтела составил:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 175,
                  child: Text(
                    imt.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 50,
                        color: Colors.black),
                  ),
                )
              ]),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextButton(
                onPressed: () => cloud.createCntrlWeight(context,
                    controllerWeight.text.trim(), controllerHeight.text.trim()),
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
                onPressed: () {
                  final DateTime now = DateTime.now();
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formatted = formatter.format(now);
                  shareWeight(controllerWeight.text.trim(),
                      controllerHeight.text.trim(), formatted);
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
                child: const Text('Отправить отчёт врачу',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HelperPageMobile(
                          uid: "9e158575-2eac-498e-ba6c-d904573b3310",
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
                child: const Text('Что это означает?',
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
    controllerHeight?.dispose();
    controllerWeight?.dispose();
    super.dispose();
  }
}
