import 'package:cardio_expert/app/mobile/state/main_state.dart';
import 'package:cardio_expert/app/models/board.dart';
import 'package:cardio_expert/localization.dart';
import 'package:cardio_expert/ui/web/hint/home.dart';
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 200, vertical: 75),
              child: Flex(direction: Axis.vertical, children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('CardioExpert',
                          style: TextStyle(
                              fontSize: 38, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HintPage()));
                              },
                              child: Text(AppLocalizations.of(context)
                                  .translate('hints'))),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(AppLocalizations.of(context)
                                          .translate('creating_board')),
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
                                              controller: controllerNameBoard,
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
                                                    .translate('lipid_profile'),
                                                hintStyle: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                                border:
                                                    const OutlineInputBorder(
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
                                            AppLocalizations.of(context)
                                                .translate('cancel'),
                                            style: TextStyle(
                                                color: Colors.red[400]),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                              AppLocalizations.of(context)
                                                  .translate('to_create')),
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
                              child: Text(AppLocalizations.of(context)
                                  .translate('create_board'))),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: StreamProvider<List<Board>>.value(
                    value: MainStateMobile().getAllBoards,
                    initialData: const [],
                    child: const ListBoard(),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    controllerNameBoard?.dispose();
    super.dispose();
  }
}
