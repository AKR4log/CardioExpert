import 'package:cardio_expert/app/models/v2board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'preview_v2board.dart';

class ListV2Board extends StatefulWidget {
  const ListV2Board({Key key}) : super(key: key);

  @override
  State<ListV2Board> createState() => _ListV2BoardState();
}

class _ListV2BoardState extends State<ListV2Board> {
  @override
  Widget build(BuildContext context) {
    final board = Provider.of<List<V2Board>>(context);
    return board.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          )
        : Wrap(
            direction: Axis.horizontal,
            spacing: 4.0,
            children: [
              ...board.map((e) => PreviewV2Board(
                    v2board: e,
                  ))
            ],
          );
  }
}
