import 'package:cardio_expert/ui/mobile/home/helper/v2/common/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/mobile/state/main_state.dart';
import '../../../../../app/models/v2board.dart';

class V2Home extends StatefulWidget {
  final String uidBoard;
  const V2Home({Key key, this.uidBoard}) : super(key: key);

  @override
  State<V2Home> createState() => _V2HomeState();
}

class _V2HomeState extends State<V2Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Информационные материалы',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: SizedBox(
            width: 350,
            height: MediaQuery.of(context).size.height,
            child: StreamProvider<List<V2Board>>.value(
              value: MainStateMobile(uidBoard: widget.uidBoard).getAllV2Boards,
              initialData: const [],
              child: const ListV2Board(),
            ),
          ),
        ),
      ),
    );
  }
}
