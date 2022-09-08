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
                                  widget.v2boardUid.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Flexible(
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
                            ],
                          ))
                        ],
                      ),
                    )),
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
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      board.name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      board.description,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                );
                              }
                            })),
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
