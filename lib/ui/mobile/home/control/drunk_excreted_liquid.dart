import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';
import '../../../../app/database/service.dart';

class ControlDrunk extends StatefulWidget {
  const ControlDrunk({Key key}) : super(key: key);

  @override
  State<ControlDrunk> createState() => _ControlDrunkState();
}

class _ControlDrunkState extends State<ControlDrunk> {
  TextEditingController controller0612highlighted = TextEditingController();
  TextEditingController controller1218highlighted = TextEditingController();
  TextEditingController controller1800highlighted = TextEditingController();
  TextEditingController controller0006highlighted = TextEditingController();
  TextEditingController controller0612drunk = TextEditingController();
  TextEditingController controller1218drunk = TextEditingController();
  TextEditingController controller1800drunk = TextEditingController();
  TextEditingController controller0006drunk = TextEditingController();

  @override
  void initState() {
    controller0006drunk = TextEditingController();
    controller0006highlighted = TextEditingController();
    controller0612drunk = TextEditingController();
    controller0612highlighted = TextEditingController();
    controller1218drunk = TextEditingController();
    controller1218highlighted = TextEditingController();
    controller1800drunk = TextEditingController();
    controller1800highlighted = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 232, 232, 1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Контроль выпитой и\nвыделенной жидкости',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 118,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              '6:00 - 12:00',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(148, 148, 148, 1)),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller0612drunk,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выпито',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
                Container(
                  height: 35,
                  width: 1,
                  color: const Color.fromRGBO(148, 148, 148, 1),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller0612highlighted,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выделено',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 118,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              '12:00 - 18:00',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(148, 148, 148, 1)),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller1218drunk,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выпито',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
                Container(
                  height: 35,
                  width: 1,
                  color: const Color.fromRGBO(148, 148, 148, 1),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller1218highlighted,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выделено',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 118,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              '18:00 - 00:00',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(148, 148, 148, 1)),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller1800drunk,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выпито',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
                Container(
                  height: 35,
                  width: 1,
                  color: const Color.fromRGBO(148, 148, 148, 1),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller1800highlighted,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выделено',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 118,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              '00:00 - 6:00',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(148, 148, 148, 1)),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller0006drunk,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выпито',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
                Container(
                  height: 35,
                  width: 1,
                  color: const Color.fromRGBO(148, 148, 148, 1),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      child: TextField(
                        controller: controller0006highlighted,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Выделено',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(148, 148, 148, 1)),
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 27),
          child: TextButton(
              onPressed: () {},
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
              child: const Text('Почему это важно?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))),
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          child: TextButton(
              onPressed: () {},
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
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          child: TextButton(
              onPressed: () => shareDrunk(
                  controller0612highlighted.text.trim(),
                  controller1218highlighted.text.trim(),
                  controller1800highlighted.text.trim(),
                  controller0006highlighted.text.trim(),
                  controller0612drunk.text.trim(),
                  controller1218drunk.text.trim(),
                  controller1800drunk.text.trim(),
                  controller0006drunk.text.trim()),
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
      ])),
    );
  }

  @override
  void dispose() {
    controller0006drunk?.dispose();
    controller0006highlighted?.dispose();
    controller0612drunk?.dispose();
    controller0612highlighted?.dispose();
    controller1218drunk?.dispose();
    controller1218highlighted?.dispose();
    controller1800drunk?.dispose();
    controller1800highlighted?.dispose();
    super.dispose();
  }
}
