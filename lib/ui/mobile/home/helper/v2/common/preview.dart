import 'package:flutter/material.dart';

import '../../../../../../app/models/v2board.dart';
import 'detail.dart';

class PreviewV2BoardMobile extends StatefulWidget {
  final V2Board v2board;
  const PreviewV2BoardMobile({Key key, this.v2board}) : super(key: key);

  @override
  State<PreviewV2BoardMobile> createState() => _PreviewV2BoardMobileState();
}

class _PreviewV2BoardMobileState extends State<PreviewV2BoardMobile> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    debugPrint(myLocale.countryCode.toString());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DetailMobile(
                  boardUid: widget.v2board.father,
                  v2boardUid: widget.v2board.uid)));
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Color.fromRGBO(229, 231, 235, 1)))),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(242, 242, 242, 1)),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 25, horizontal: 22)),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Text(
                myLocale.countryCode.toString() != "KZ"
                    ? widget.v2board.name
                    : widget.v2board.name_kz,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Flexible(
              child: Icon(
                Icons.chevron_right_rounded,
                color: Color.fromRGBO(225, 98, 98, 1),
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
