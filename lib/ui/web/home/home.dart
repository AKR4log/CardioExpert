import 'package:cardio_expert/app/mobile/state/main_state.dart';
import 'package:cardio_expert/app/models/board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/database/firebase.dart';
import 'common/list_board.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({Key key}) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  TextEditingController controllerNameBoard = TextEditingController();

  @override
  void initState() {
    controllerNameBoard = TextEditingController();
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
                      const Flexible(
                          flex: 4,
                          child: Text(
                            'CardioExpert',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Flexible(
                          child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Создание доски'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 4),
                                              child: const Text(
                                                  'Введите название доски:',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                  )),
                                            ),
                                            TextField(
                                              controller: controllerNameBoard,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 15),
                                                hintText: 'Липидный Профиль',
                                                hintStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromRGBO(
                                                            229, 231, 235, 1))),
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
                                                .createBoard(
                                                    context,
                                                    controllerNameBoard.text
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
                              child: Text('Создать доску')),
                        ],
                      ))
                    ],
                  ),
                )),
                Flexible(
                  flex: 6,
                  child: StreamProvider<List<Board>>.value(
                    value: MainStateMobile().getAllBoards,
                    initialData: const [],
                    child: const ListBoard(),
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
    controllerNameBoard?.dispose();
    super.dispose();
  }
}
