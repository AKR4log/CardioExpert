import 'package:cardio_expert/app/models/board.dart';
import 'package:cardio_expert/ui/web/home/common/preview_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListBoard extends StatefulWidget {
  const ListBoard({Key key}) : super(key: key);

  @override
  State<ListBoard> createState() => _ListBoardState();
}

class _ListBoardState extends State<ListBoard> {
  @override
  Widget build(BuildContext context) {
    final board = Provider.of<List<Board>>(context);
    return board.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            primary: true,
            itemCount: board.length,
            itemBuilder: (context, index) {
              return PreviewBoard(board: board[index]);
            },
          );
  }
}
