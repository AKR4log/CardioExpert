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
    return Row(children: [Text('Пульс:'), Text(pulse)]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/pulse.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Мой пульс',
    text: 'Мой измеренный пульс',
    filePath: file.path,
  );
}

Future<void> shareWeight(String weight, String height) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('Вес:'), Text(weight)]),
      Row(children: [Text('Рост:'), Text(height)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/weight.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Мой индекс веса',
    text: 'Мой измеренный вес и рост',
    filePath: file.path,
  );
}

Future<void> shareBlood(String upper, String lower) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('Верхнее давление:'), Text(upper)]),
      Row(children: [Text('Нижнее давление:'), Text(lower)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/blood.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Контроль арт. давление',
    text: 'Моё измеренное давление',
    filePath: file.path,
  );
}

Future<void> shareMno(String mno) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('Показатели МНО:'), Text(mno)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/mno.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Показатели МНО',
    text: 'Моё измеренное МНО',
    filePath: file.path,
  );
}

Future<void> shareLipidProfile(
    String cholesterol, String ldl, String hdl, String triglycerides) async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [Text('«Холестерин»:'), Text(cholesterol)]),
      Row(children: [Text('«ЛПНП»:'), Text(ldl)]),
      Row(children: [Text('«ЛПВП»:'), Text(hdl)]),
      Row(children: [Text('«Триглицериды»:'), Text(triglycerides)]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/mno.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Липидный профиль',
    text: 'Моё измеренное липидного профиля',
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
      Row(children: [Text('Выпито с 06:00 по 12:00:'), Text(num0612drunk)]),
      Row(children: [
        Text('Выделено с 06:00 по 12:00:'),
        Text(num0612highlighted)
      ]),
      Row(children: [Text('Выпито с 12:00 по 18:00:'), Text(num1218drunk)]),
      Row(children: [Text('Выделено с 12:00 по 18:00:'), Text(num1218drunk)]),
      Row(children: [Text('Выпито с 18:00 по 00:00:'), Text(num1800drunk)]),
      Row(children: [
        Text('Выделено с 18:00 по 00:00:'),
        Text(num1800highlighted)
      ]),
      Row(children: [Text('Выпито с 00:00 по 06:00:'), Text(num0006drunk)]),
      Row(children: [
        Text('Выделено с 00:00 по 06:00:'),
        Text(num0006highlighted)
      ]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/drunk.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Контроль жидкости',
    text: 'Контроль выпитой и выделенной жидкости',
    filePath: file.path,
  );
}
