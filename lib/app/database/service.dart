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

Future<void> shareFile() async {
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [Text('HeLLLOO')]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/example.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Example share',
    text: 'Example share text',
    filePath: file.path,
  );
}
