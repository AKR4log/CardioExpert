import 'package:cardio_expert/localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/database/firebase.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    var cloud = Provider.of<Cloud>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context).translate('recent_measurements'),
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(AppLocalizations.of(context).translate('confirmation')),
              TextButton(
                onPressed: () {
                  cloud.ints();
                },
                child: Text(
                  AppLocalizations.of(context).translate('send_report'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
