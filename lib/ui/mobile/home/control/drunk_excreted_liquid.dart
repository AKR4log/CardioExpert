import 'package:flutter/material.dart';

class ControlDrunk extends StatefulWidget {
  const ControlDrunk({Key key}) : super(key: key);

  @override
  State<ControlDrunk> createState() => _ControlDrunkState();
}

class _ControlDrunkState extends State<ControlDrunk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Контроль выпитой и\nвыделенной жидкости',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Column(children: [])),
    );
  }
}
