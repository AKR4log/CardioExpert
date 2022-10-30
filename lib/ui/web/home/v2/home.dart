import 'package:cardio_expert/app/models/v2board.dart';
import 'package:cardio_expert/localization.dart';
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
  TextEditingController controllerNameKZ = TextEditingController();
  TextEditingController controllerDescriptionKZ = TextEditingController();

  @override
  void initState() {
    controllerDescription = TextEditingController();
    controllerName = TextEditingController();
    controllerDescriptionKZ = TextEditingController();
    controllerNameKZ = TextEditingController();
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
                      child: Text(widget.name ?? "Атауы жоқ",
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
                            child: Text(AppLocalizations.of(context)
                                .translate('to_main_page'))),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(AppLocalizations.of(context)
                                        .translate('creating_v2_board')),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Text(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        'enter_name_board'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                )),
                                          ),
                                          TextField(
                                            controller: controllerNameKZ,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              hintText: AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'lipid_profile_allows'),
                                              hintStyle: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          229, 231, 235, 1))),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 4),
                                            child: const Text(
                                                "Введите название доски на русском",
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
                                                  "Липидный Профиль позволяет...",
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
                                            child: Text(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        'enter_description_board'),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                )),
                                          ),
                                          TextField(
                                            controller: controllerDescriptionKZ,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              hintText: AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      'lipid_profile_allows'),
                                              hintStyle: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black54),
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          229, 231, 235, 1))),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 4),
                                            child: const Text(
                                                "Введите описание доски на русском",
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
                                                  "Липидный Профиль позволяет...",
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
                                          AppLocalizations.of(context)
                                              .translate('cancel'),
                                          style:
                                              TextStyle(color: Colors.red[400]),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text(AppLocalizations.of(context)
                                            .translate('to_create')),
                                        onPressed: () {
                                          cloud
                                              .createV2Board(
                                                  context,
                                                  widget.uidBoard,
                                                  controllerName.text.trim(),
                                                  controllerNameKZ.text.trim(),
                                                  controllerDescription.text
                                                      .trim(),
                                                  controllerDescriptionKZ.text
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
                            child: Text(AppLocalizations.of(context)
                                .translate('creating_v2_board'))),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 6,
                child: StreamProvider<List<V2Board>>.value(
                  value:
                      MainStateMobile(uidBoard: widget.uidBoard).getAllV2Boards,
                  initialData: const [],
                  child: const ListV2Board(),
                ),
              ),
            ]),
          ),
        )));
  }

  @override
  void dispose() {
    controllerDescription?.dispose();
    controllerName?.dispose();
    controllerDescriptionKZ?.dispose();
    controllerNameKZ?.dispose();
    super.dispose();
  }
}
