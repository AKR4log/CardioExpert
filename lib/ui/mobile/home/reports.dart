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
        title: const Text(
          'Последние измерения',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                  'Нажимая, вы отправляете в отчёте, все последние показатели в PDF файле. Это может занять, какое-то время..'),
              TextButton(
                onPressed: () {
                  cloud.ints();
                },
                child: const Text(
                  'Отправить отчёт',
                  style: TextStyle(
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
