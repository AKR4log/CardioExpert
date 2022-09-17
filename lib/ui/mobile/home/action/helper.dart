import 'package:flutter/material.dart';

import '../../../../app/mobile/state/main_state.dart';
import '../../../../app/models/hint.dart';

class HelperPageMobile extends StatefulWidget {
  final String uid;
  const HelperPageMobile({Key key, this.uid}) : super(key: key);

  @override
  State<HelperPageMobile> createState() => _HelperPageMobileState();
}

class _HelperPageMobileState extends State<HelperPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.uid,
            style: const TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<Hint>(
              stream: MainStateMobile(uidHint: widget.uid).getHints,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Hint hint = snapshot.data;
                  return SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hint.name,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          hint.description,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  );
                }
                return const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
