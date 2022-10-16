import 'package:cardio_expert/app/models/v2board.dart';
import 'package:cardio_expert/localization.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class PreviewV2Board extends StatefulWidget {
  final V2Board v2board;
  const PreviewV2Board({Key key, this.v2board}) : super(key: key);

  @override
  State<PreviewV2Board> createState() => _PreviewV2BoardState();
}

class _PreviewV2BoardState extends State<PreviewV2Board> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DetailV2Board(
                  v2boardUid: widget.v2board.uid,
                  boardUid: widget.v2board.father)));
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey[100]))),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).translate('board_v2'),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              widget.v2board.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
