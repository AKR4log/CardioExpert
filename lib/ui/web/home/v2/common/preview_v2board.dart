import 'package:cardio_expert/app/models/v2board.dart';
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
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DetailV2Board(
                v2boardUid: widget.v2board.uid,
                boardUid: widget.v2board.father)));
      },
      child: Container(
        width: 600,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          widget.v2board.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
