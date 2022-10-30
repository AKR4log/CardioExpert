// ignore_for_file: missing_return

import 'package:flutter/material.dart';

import '../../../../../../app/mobile/state/main_state.dart';
import '../../../../../../app/models/v2board.dart';

class DetailMobile extends StatefulWidget {
  final String v2boardUid;
  final String boardUid;
  const DetailMobile({Key key, this.boardUid, this.v2boardUid})
      : super(key: key);

  @override
  State<DetailMobile> createState() => _DetailMobileState();
}

class _DetailMobileState extends State<DetailMobile> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    debugPrint(myLocale.countryCode.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<V2Board>(
            stream: MainStateMobile(
                    uidV2Board: widget.v2boardUid, uidBoard: widget.boardUid)
                .getV2Boards,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                V2Board board = snapshot.data;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myLocale.countryCode.toString() != "KZ"
                            ? board.name
                            : board.name_kz,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        myLocale.countryCode.toString() != "KZ"
                            ? board.description
                            : board.description_kz,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              );
            }),
      ),
    );
  }
}
