// ignore_for_file: missing_return

import 'package:cardio_expert/app/models/v2board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/database/firebase.dart';
import '../../../../../app/mobile/state/main_state.dart';
import '../../home.dart';

class DetailV2Board extends StatefulWidget {
  final String v2boardUid;
  final String boardUid;
  const DetailV2Board({Key key, this.v2boardUid, this.boardUid})
      : super(key: key);

  @override
  State<DetailV2Board> createState() => _DetailV2BoardState();
}

class _DetailV2BoardState extends State<DetailV2Board> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 75),
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Text(widget.v2boardUid.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
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
                                                margin: const EdgeInsets.only(
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
                                                controller: controllerName,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                                decoration:
                                                    const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 15),
                                                  hintText:
                                                      'Зачем нужен Липидный Профиль?',
                                                  hintStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              229,
                                                              231,
                                                              235,
                                                              1))),
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Container(
                                                margin: const EdgeInsets.only(
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
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                                decoration:
                                                    const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 15),
                                                  hintText:
                                                      'Липидный Профиль позволяет...',
                                                  hintStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromRGBO(
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
                                                  .updateV2Board(
                                                      context,
                                                      widget.boardUid,
                                                      widget.v2boardUid,
                                                      controllerName.text
                                                          .trim(),
                                                      controllerDescription.text
                                                          .trim())
                                                  .whenComplete(() {
                                                Navigator.of(context).pop();
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
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: StreamBuilder<V2Board>(
                        stream: MainStateMobile(
                                uidV2Board: widget.v2boardUid,
                                uidBoard: widget.boardUid)
                            .getV2Boards,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            V2Board board = snapshot.data;
                            return SizedBox(
                              width: MediaQuery.of(context).size.width - 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Название: ${board.name}",
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "Описание: ${board.description}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
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
                  ),
                ]),
          ),
        )));
  }
}
