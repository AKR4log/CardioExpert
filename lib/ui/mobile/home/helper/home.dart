import 'package:cardio_expert/localization.dart';
import 'package:cardio_expert/ui/mobile/home/helper/common/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/mobile/state/main_state.dart';
import '../../../../app/models/board.dart';

class HelperPage extends StatefulWidget {
  const HelperPage({Key key}) : super(key: key);

  @override
  State<HelperPage> createState() => _HelperPageState();
}

class _HelperPageState extends State<HelperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('informational_materials'),
          style: const TextStyle(color: Colors.black),
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
            child: StreamProvider<List<Board>>.value(
              value: MainStateMobile().getAllBoards,
              initialData: const [],
              child: const Listing(),
            ),
          ),
        ),
      ),
    );
  }
}
