import 'package:flutter/material.dart';

import '../../../../../app/models/board.dart';
import '../v2/home.dart';

class PreviewListing extends StatefulWidget {
  final Board board;
  const PreviewListing({Key key, this.board}) : super(key: key);

  @override
  State<PreviewListing> createState() => _PreviewListingState();
}

class _PreviewListingState extends State<PreviewListing> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    debugPrint(myLocale.countryCode.toString());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  V2Home(uidBoard: widget.board.uid)));
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
                    ? widget.board.name
                    : widget.board.name_kz,
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
