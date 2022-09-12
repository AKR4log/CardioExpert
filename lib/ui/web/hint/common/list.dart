import 'package:cardio_expert/app/models/hint.dart';
import 'package:cardio_expert/ui/web/hint/common/preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHint extends StatefulWidget {
  const ListHint({Key key}) : super(key: key);

  @override
  State<ListHint> createState() => _ListHintState();
}

class _ListHintState extends State<ListHint> {
  @override
  Widget build(BuildContext context) {
    final hint = Provider.of<List<Hint>>(context);
    return hint.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            primary: true,
            itemCount: hint.length,
            itemBuilder: (context, index) {
              return PreviewHint(hint: hint[index]);
            },
          );
  }
}
