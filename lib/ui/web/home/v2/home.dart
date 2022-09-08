import 'package:cardio_expert/app/models/v2board.dart';
import 'package:cardio_expert/ui/web/home/home.dart';
import 'package:cardio_expert/ui/web/home/v2/common/list_v2board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/database/firebase.dart';
import '../../../../app/mobile/state/main_state.dart';

class HomeV2 extends StatefulWidget {
  final String uidBoard;
  final String name;
  const HomeV2({Key key, this.name, this.uidBoard}) : super(key: key);

  @override
  State<HomeV2> createState() => _HomeV2State();
}

class _HomeV2State extends State<HomeV2> {
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
              child: Flex(direction: Axis.vertical, children: [
                Flexible(
                    child: Container(
                  width: 600,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
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
                              widget.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Flexible(
                          flex: 2,
                          child: Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
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
                                          title:
                                              const Text('Создание v2 доски'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 4),
                                                  child: const Text(
                                                      'Введите название доски:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                      )),
                                                ),
                                                TextField(
                                                  controller: controllerName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                            color:
                                                                Color.fromRGBO(
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
                                                      'Введите описание доски:',
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
                                                            color:
                                                                Color.fromRGBO(
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
                                              child: const Text('Создать'),
                                              onPressed: () {
                                                cloud
                                                    .createV2Board(
                                                        context,
                                                        widget.uidBoard,
                                                        controllerName.text
                                                            .trim(),
                                                        controllerDescription
                                                            .text
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
                                  child: Text('Создать v2 доску')),
                            ],
                          ))
                    ],
                  ),
                )),
                Flexible(
                  flex: 6,
                  child: StreamProvider<List<V2Board>>.value(
                    value: MainStateMobile(uidBoard: widget.uidBoard)
                        .getAllV2Boards,
                    initialData: const [],
                    child: const ListV2Board(),
                  ),
                ),
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

  @override
  void dispose() {
    controllerDescription?.dispose();
    controllerName?.dispose();
    super.dispose();
  }
}
