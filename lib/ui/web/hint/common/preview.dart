import 'package:cardio_expert/app/models/hint.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class PreviewHint extends StatefulWidget {
  final Hint hint;
  const PreviewHint({Key key, this.hint}) : super(key: key);

  @override
  State<PreviewHint> createState() => _PreviewHintState();
}

class _PreviewHintState extends State<PreviewHint> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailHint(hintUid: widget.hint.uid)));
      },
      child: Container(
        width: 600,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          widget.hint.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
