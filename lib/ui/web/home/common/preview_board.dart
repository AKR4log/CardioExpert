import 'package:cardio_expert/app/models/board.dart';
import 'package:flutter/material.dart';

import '../v2/home.dart';

class PreviewBoard extends StatefulWidget {
  final Board board;
  const PreviewBoard({Key key, this.board}) : super(key: key);

  @override
  State<PreviewBoard> createState() => _PreviewBoardState();
}

class _PreviewBoardState extends State<PreviewBoard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                HomeV2(uidBoard: widget.board.uid, name: widget.board.name)));
      },
      child: Container(
        width: 600,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          widget.board.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
