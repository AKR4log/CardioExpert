import 'dart:io';

import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setName(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Name', value);
}

Future<String> getName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Name');
}

Future<bool> setSurname(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Surname', value);
}

Future<String> getSurname() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Surname');
}

Future<bool> setAge(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Age', value);
}

Future<String> getAge() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Age');
}

Future<bool> setFullNameDoctor(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('FullNameDoctor', value);
}

Future<String> getFullNameDoctor() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('FullNameDoctor');
}

Future<bool> setEmail(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Email', value);
}

Future<String> getEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Email');
}

Future<bool> setPhoneDoctor(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('PhoneDoctor', value);
}

Future<String> getPhoneDoctor() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('PhoneDoctor');
}

Future<bool> setPassword(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('Password', value);
}

Future<String> getPassword() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Password');
}

Future<void> sharePulse(String pulse) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Row(children: [Text('Pulse:'), Text(pulse)]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/pulse.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'My pulse',
    text: 'My measured pulse',
    filePath: file.path,
  );
}

Future<void> shareWeight(String weight, String height) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('Weight: '), Text(weight)]),
      Row(children: [Text('Height: '), Text(height)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/weight.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'My weight index',
    text: 'My measured weight and height',
    filePath: file.path,
  );
}

Future<void> shareBlood(String upper, String lower) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('Upper pressure: '), Text(upper)]),
      Row(children: [Text('Lower pressure: '), Text(lower)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/blood.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Control art. pressure',
    text: 'My measured pressure',
    filePath: file.path,
  );
}

Future<void> shareMno(String mno) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('INR indicators: '), Text(mno)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/mno.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'INR indicators',
    text: 'My measured by ME',
    filePath: file.path,
  );
}

Future<void> shareLipidProfile(
    String cholesterol, String ldl, String hdl, String triglycerides) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('"Cholesterol": '), Text(cholesterol)]),
      Row(children: [Text('"LDL": '), Text(ldl)]),
      Row(children: [Text('"HDL": '), Text(hdl)]),
      Row(children: [Text('"Triglycerides": '), Text(triglycerides)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/mno.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Lipid profile',
    text: 'My measured lipid profile',
    filePath: file.path,
  );
}

Future<void> shareDrunk(
    String num0612highlighted,
    String num1218highlighted,
    String num1800highlighted,
    String num0006highlighted,
    String num0612drunk,
    String num1218drunk,
    String num1800drunk,
    String num0006drunk) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('Drunk from 06:00 to 12:00: '), Text(num0612drunk)]),
      Row(children: [
        Text('Allocated from 06:00 to 12:00: '),
        Text(num0612highlighted)
      ]),
      Row(children: [Text('Drunk from 12:00 to 18:00: '), Text(num1218drunk)]),
      Row(children: [
        Text('Allocated from 12:00 to 18:00: '),
        Text(num1218drunk)
      ]),
      Row(children: [Text('Drunk from 18:00 to 00:00: '), Text(num1800drunk)]),
      Row(children: [
        Text('Allocated from 18:00 to 00:00: '),
        Text(num1800highlighted)
      ]),
      Row(children: [Text('Drunk from 00:00 to 06:00: '), Text(num0006drunk)]),
      Row(children: [
        Text('Allocated from 00:00 to 06:00: '),
        Text(num0006highlighted)
      ]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/drunk.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Fluid control',
    text: 'Control of the drunk and excreted liquid',
    filePath: file.path,
  );
}

Future<void> shareReport(
    {String weight,
    String height,
    String upper,
    String lower,
    String mno,
    String pulse,
    String cholesterol,
    String ldl,
    String hdl,
    String triglycerides,
    String h0612,
    String h1218,
    String h1800,
    String h0006,
    String d0612,
    String d1218,
    String d1800,
    String d0006}) async {
  var pdf = Document();
  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weight control. Body mass Index',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Row(children: [
                            Text('Weight:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(weight, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('Height:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(height, style: const TextStyle(fontSize: 15)),
                          ]),
                        ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Blood pressure monitoring',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Row(children: [
                            Text('Upper pressure:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(upper, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('Lower pressure:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(lower, style: const TextStyle(fontSize: 15)),
                          ]),
                        ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Control of INR when taking Warfarin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Row(children: [
                            Text('Passed the INR, enter your indicator:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(mno, style: const TextStyle(fontSize: 15)),
                          ]),
                        ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pulse monitoring',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Row(children: [
                            Text('Your pulse:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(pulse, style: const TextStyle(fontSize: 15)),
                          ]),
                        ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lipid profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Row(children: [
                            Text(
                                'Have passed the tests, enter your "Cholesterol" indicator:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(cholesterol,
                                style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text(
                                'Have passed the tests, enter your LDL indicator:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(ldl, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text(
                                'Have passed the tests, enter your "HDL" indicator:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(hdl, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text(
                                'PHave passed the tests, enter your indicator "Triglycerides":',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(triglycerides,
                                style: const TextStyle(fontSize: 15)),
                          ]),
                        ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Control of the drunk and excreted liquid',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Row(children: [
                            Text('6:00 - 12:00 Drunk:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(d0612, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('6:00 - 12:00 Highlighted:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(h0612, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('12:00 - 18:00 Drunk:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(d1218, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('12:00 - 18:00 Highlighted:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(h1218, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('18:00 - 00:00 Drunk:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(d1800, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('18:00 - 00:00 Highlighted:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(h1800, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('00:00 - 6:00 Drunk:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(d0006, style: const TextStyle(fontSize: 15)),
                          ]),
                          Row(children: [
                            Text('00:00 - 6:00 Highlighted:',
                                style: const TextStyle(fontSize: 15)),
                            SizedBox(width: 10),
                            Text(h0006, style: const TextStyle(fontSize: 15)),
                          ]),
                        ]))
                  ])),
        ]);
      }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/report.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'All reports',
    text: 'All recent reports',
    filePath: file.path,
  );
}
