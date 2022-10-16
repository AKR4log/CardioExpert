import 'package:cardio_expert/app/models/hint.dart';
import 'package:cardio_expert/localization.dart';
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
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  DetailHint(hintUid: widget.hint.uid)));
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
              AppLocalizations.of(context).translate('hint'),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              widget.hint.name,
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
