import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';

class AddTablet extends StatefulWidget {
  const AddTablet({Key key}) : super(key: key);

  @override
  State<AddTablet> createState() => _AddTabletState();
}

class _AddTabletState extends State<AddTablet> {
  TextEditingController controllerRecTime1 = TextEditingController();
  TextEditingController controllerRecTime2 = TextEditingController();
  TextEditingController controllerRecTime3 = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDosage = TextEditingController();
  DateTimeRange selectedDate;
  String start, end, numb = "1";

  Future<void> _selectDate(BuildContext context) async {
    final DateTimeRange picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: DateTimeRange(
          end: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 13),
          start: DateTime.now(),
        ),
        builder: (context, child) {
          return Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400.0,
                ),
                child: child,
              )
            ],
          );
        });
    setState(() {
      start =
          "${picked.start.year.toString()}-${picked.start.month.toString().padLeft(2, '0')}-${picked.start.day.toString().padLeft(2, '0')}";
      end =
          "${picked.end.year.toString()}-${picked.end.month.toString().padLeft(2, '0')}-${picked.end.day.toString().padLeft(2, '0')}";
    });
  }

  @override
  void initState() {
    controllerDosage = TextEditingController();
    controllerName = TextEditingController();
    controllerRecTime1 = TextEditingController();
    controllerRecTime2 = TextEditingController();
    controllerRecTime3 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Добавить препарат',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 98, 98, 1),
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
                  child: const Text('Название препарата:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: 'Препарат...',
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
                  child: const Text('Дозировка препарата:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                ),
                TextField(
                  controller: controllerDosage,
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
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            child: TextButton(
                onPressed: () => _selectDate(context),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                              color: Color.fromRGBO(229, 231, 235, 1)))),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 55)),
                ),
                child: const Text('Период приёма')),
          ),
          Row(
            children: [
              start != null && start != ''
                  ? Text(
                      start.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 98, 98, 1)),
                    )
                  : const SizedBox(),
              start != null && start != '' && end != null && end != ''
                  ? const Text(
                      ' - ',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 98, 98, 1)),
                    )
                  : const SizedBox(),
              end != null && end != ''
                  ? Text(
                      end.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 98, 98, 1)),
                    )
                  : const SizedBox(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Сколько раз в день (приём):',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (numb == "2") {
                            setState(() {
                              numb = "1";
                            });
                          }
                          if (numb == "3") {
                            setState(() {
                              numb = "2";
                            });
                          }
                        },
                        icon: const Icon(Icons.remove, size: 30)),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        numb,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (numb == "3") {}
                          if (numb == "2") {
                            setState(() {
                              numb = "3";
                            });
                          }
                          if (numb == "1") {
                            setState(() {
                              numb = "2";
                            });
                          }
                        },
                        icon: const Icon(Icons.add, size: 30))
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                numb == "1"
                    ? Column(
                        children: [
                          const Text(
                            'Время 1 приёма',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextField(
                              controller: controllerRecTime1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  color: Colors.black),
                              inputFormatters: [MaskedInputFormatter('##:##')],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                hintText: '00:00',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.black54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )
                    : numb == "2"
                        ? Column(
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Время 1 приёма',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: TextField(
                                      controller: controllerRecTime1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 30,
                                          color: Colors.black),
                                      inputFormatters: [
                                        MaskedInputFormatter('##:##')
                                      ],
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        hintText: '00:00',
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 30,
                                            color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Время 2 приёма',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: TextField(
                                      controller: controllerRecTime2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 30,
                                          color: Colors.black),
                                      inputFormatters: [
                                        MaskedInputFormatter('##:##')
                                      ],
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        hintText: '00:00',
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 30,
                                            color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : numb == "3"
                            ? Column(
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Время 1 приёма',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                          controller: controllerRecTime1,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30,
                                              color: Colors.black),
                                          inputFormatters: [
                                            MaskedInputFormatter('##:##')
                                          ],
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 15),
                                            hintText: '00:00',
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 30,
                                                color: Colors.black54),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Время 2 приёма',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                          controller: controllerRecTime2,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30,
                                              color: Colors.black),
                                          inputFormatters: [
                                            MaskedInputFormatter('##:##')
                                          ],
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 15),
                                            hintText: '00:00',
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 30,
                                                color: Colors.black54),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Время 3 приёма',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                          controller: controllerRecTime3,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30,
                                              color: Colors.black),
                                          inputFormatters: [
                                            MaskedInputFormatter('##:##')
                                          ],
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 15),
                                            hintText: '00:00',
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 30,
                                                color: Colors.black54),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : const SizedBox(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextButton(
                onPressed: () => cloud.createMedication(
                    context,
                    controllerRecTime1.text.trim(),
                    controllerRecTime2.text.trim(),
                    controllerRecTime3.text.trim(),
                    controllerName.text.trim(),
                    controllerDosage.text.trim(),
                    "$start - $end"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(255, 98, 98, 1)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 28)),
                ),
                child: const Text('Добавить',
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
    controllerDosage?.dispose();
    controllerName?.dispose();
    controllerRecTime1?.dispose();
    controllerRecTime2?.dispose();
    controllerRecTime3?.dispose();
    super.dispose();
  }
}
