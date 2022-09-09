import 'package:cardio_expert/ui/mobile/home/helper/common/preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/models/board.dart';

class Listing extends StatefulWidget {
  const Listing({Key key}) : super(key: key);

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
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
              return PreviewListing(board: board[index]);
            },
          );
  }
}
