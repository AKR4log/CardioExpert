// ignore_for_file: missing_return

import 'package:cardio_expert/app/models/hint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/database/firebase.dart';
import '../../../../../app/mobile/state/main_state.dart';
import '../../home/home.dart';

class DetailHint extends StatefulWidget {
  final String hintUid;
  const DetailHint({Key key, this.hintUid}) : super(key: key);

  @override
  State<DetailHint> createState() => _DetailHintState();
}

class _DetailHintState extends State<DetailHint> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @override
  void initState() {
    controllerDescription = TextEditingController();
    controllerName = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              width: 600,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromRGBO(242, 242, 242, 1))),
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Container(
                      width: 600,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15)),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromRGBO(242, 242, 242, 1))),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                              flex: 3,
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  widget.hintUid.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Flexible(
                              flex: 3,
                              child: Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const HomePageWeb()));
                                      },
                                      child: const Text('На главную')),
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Редактирование подсказки'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 4),
                                                      child: const Text(
                                                          'Введите новое название подсказки:',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13,
                                                          )),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          controllerName,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        15),
                                                        hintText:
                                                            'Зачем нужен Липидный Профиль?',
                                                        hintStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        229,
                                                                        231,
                                                                        235,
                                                                        1))),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 4),
                                                      child: const Text(
                                                          'Введите новое описание подсказки:',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13,
                                                          )),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          controllerDescription,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        15),
                                                        hintText:
                                                            'Липидный Профиль позволяет...',
                                                        hintStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54),
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        229,
                                                                        231,
                                                                        235,
                                                                        1))),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    'Отменить',
                                                    style: TextStyle(
                                                        color: Colors.red[400]),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Готово'),
                                                  onPressed: () {
                                                    cloud
                                                        .updateHint(
                                                            context,
                                                            widget.hintUid,
                                                            controllerName.text
                                                                .trim(),
                                                            controllerDescription
                                                                .text
                                                                .trim())
                                                        .whenComplete(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Text('Редактировать')),
                                ],
                              ))
                        ],
                      ),
                    )),
                    Flexible(
                        flex: 6,
                        child: SizedBox(
                          width: 600,
                          height: 300,
                          child: StreamBuilder<Hint>(
                              stream: MainStateMobile(uidHint: widget.hintUid)
                                  .getHints,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Hint hint = snapshot.data;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Название: ${hint.name}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Описание: ${hint.description}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  );
                                }
                                return const SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator(),
                                );
                              }),
                        )),
                    Flexible(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(15)),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromRGBO(242, 242, 242, 1))),
                    )),
                  ]),
            ),
          ),
        )));
  }
}
