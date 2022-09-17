import 'package:cardio_expert/app/models/hint.dart';
import 'package:cardio_expert/ui/web/hint/common/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/database/firebase.dart';
import '../../../app/mobile/state/main_state.dart';
import '../home/home.dart';

class HintPage extends StatefulWidget {
  const HintPage({Key key}) : super(key: key);

  @override
  State<HintPage> createState() => _HintPageState();
}

class _HintPageState extends State<HintPage> {
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
            child: Flex(direction: Axis.vertical, children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Text("CardioExpert подсказки",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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
                                    title: const Text('Создание v2 доски'),
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
                                            controller: controllerName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.black),
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              hintText:
                                                  'Зачем нужен Липидный Профиль?',
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
                                          const SizedBox(height: 15),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 4),
                                            child: const Text(
                                                'Введите описание доски:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                )),
                                          ),
                                          TextField(
                                            controller: controllerDescription,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.black),
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              hintText:
                                                  'Липидный Профиль позволяет...',
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
                                          style:
                                              TextStyle(color: Colors.red[400]),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Создать'),
                                        onPressed: () {
                                          cloud
                                              .createHint(
                                                  context,
                                                  controllerName.text.trim(),
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
                            child: const Text('Создать подсказку')),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 6,
                child: StreamProvider<List<Hint>>.value(
                  value: MainStateMobile().getAllHints,
                  initialData: const [],
                  child: const ListHint(),
                ),
              ),
            ]),
          ),
        )));
  }
}
