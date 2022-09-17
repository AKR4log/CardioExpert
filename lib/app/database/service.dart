import 'dart:io';

import 'package:flutter/services.dart';
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

Future<void> sharePulse(String pulse, String date) async {
  var data = await rootBundle.load("assets/font/Montserrat-Regular.ttf");
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [
        Text('Дата последнего измерения: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(date,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Ваш пульс: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(pulse,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ])
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/pulse.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Мой пульс',
    filePath: file.path,
  );
}

Future<void> shareWeight(String weight, String height, String date) async {
  var data = await rootBundle.load("assets/font/Montserrat-Regular.ttf");
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [
        Text('Дата последнего измерения: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(date,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Вес: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(weight,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Рост: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(height,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/weight.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Мой вес и рост',
    filePath: file.path,
  );
}

Future<void> shareBlood(String upper, String lower, String date) async {
  var data = await rootBundle.load("assets/font/Montserrat-Regular.ttf");
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [
        Text('Дата последнего измерения: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(date,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Верхнее давление: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(upper,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Нижнее давление: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(lower,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/blood.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Контроль артериального давления',
    filePath: file.path,
  );
}

Future<void> shareMno(String mno, String date) async {
  var data = await rootBundle.load("assets/font/Montserrat-Regular.ttf");
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [
        Text('Дата последнего измерения: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(date,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('MNO показатель: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(mno,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/mno.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'MNO показатель',
    filePath: file.path,
  );
}

Future<void> shareLipidProfile(String cholesterol, String ldl, String hdl,
    String triglycerides, String date) async {
  var data = await rootBundle.load("assets/font/Montserrat-Regular.ttf");
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [
        Text('Дата последнего измерения: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(date,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('"Холестерин": ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(cholesterol,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('"ЛПНП": ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(ldl,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('"ЛПВП": ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(hdl,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('"Триглицериды": ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(triglycerides,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/mno.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Липидный профиль',
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
    String num0006drunk,
    String date) async {
  var data = await rootBundle.load("assets/font/Montserrat-Regular.ttf");
  var pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(children: [
      Row(children: [
        Text('Дата последнего измерения: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(date,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выпито с 06:00 по 12:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num0612drunk,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выделино с 06:00 по 12:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num0612highlighted,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выпито с 12:00 по 18:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num1218drunk,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выделино с 12:00 по 18:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num1218drunk,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выпито с 18:00 по 00:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num1800drunk,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выделино с 18:00 по 00:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num1800highlighted,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выпито с 00:00 по 06:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num0006drunk,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
      Row(children: [
        Text('Выделино с 00:00 по 06:00: ',
            style: TextStyle(
              font: Font.ttf(data),
            )),
        Text(num0006highlighted,
            style: TextStyle(
              font: Font.ttf(data),
            ))
      ]),
    ]);
  }));
  pdf.save();
  final dir = await getExternalStorageDirectory();
  final String path = "${dir.path}/drunk.pdf";

  var file = await File(path).writeAsBytes(await pdf.save());
  await FlutterShare.shareFile(
    title: 'Контроль воды',
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
    String d0006,
    String dateW,
    String dateP,
    String dateM,
    String dateL,
    String dateB,
    String dateD}) async {
  var pdf = Document(version: PdfVersion.pdf_1_5, verbose: true);
  var data = await rootBundle.load("assets/font/Montserrat-Regular.ttf");

  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Контроль веса. Индекса массы тела',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.ttf(data),
                            fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('Дата последнего измерения: ',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                Text(dateW,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data)))
                              ]),
                              Row(children: [
                                Text('Вес:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(weight,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('Рост:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(height,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                            ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Мониторинг артериального давления',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.ttf(data),
                            fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('Дата последнего измерения: ',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                Text(dateB,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data)))
                              ]),
                              Row(children: [
                                Text('Верхнее давление:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(upper,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('Нижнее давление:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(lower,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                            ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Контроль МНО при приеме Варфарина',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.ttf(data),
                            fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('Дата последнего измерения: ',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                Text(dateM,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data)))
                              ]),
                              Row(children: [
                                Text('Сдали МНО, введите ваш показатель:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(mno,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                            ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Мониторинг пульса',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.ttf(data),
                            fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('Дата последнего измерения: ',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                Text(dateP,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data)))
                              ]),
                              Row(children: [
                                Text('Ваш пульс:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(pulse,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                            ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Липидный профиль',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.ttf(data),
                            fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('Дата последнего измерения: ',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                Text(dateL,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data)))
                              ]),
                              Row(children: [
                                Text(
                                    'Сдали анализы, введите свой показатель "Холестерин":',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(cholesterol,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text(
                                    'Пройдя тесты, введите свой показатель ЛПНП:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(ldl,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text(
                                    'Пройдя тесты, введите свой показатель "ЛПВП":',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(hdl,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text(
                                    'Сдали анализы, введите свой показатель "Триглицериды".:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(triglycerides,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                            ]))
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Контроль выпитой и выделяемой жидкости',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.ttf(data),
                            fontSize: 22)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('Дата последнего измерения: ',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                Text(dateD,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data)))
                              ]),
                              Row(children: [
                                Text('6:00 - 12:00 Выпито:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(d0612,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('6:00 - 12:00 Выделено:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(h0612,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('12:00 - 18:00 Выпито:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(d1218,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('12:00 - 18:00 Выделено:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(h1218,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('18:00 - 00:00 Выпито:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(d1800,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('18:00 - 00:00 Выделено:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(h1800,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('00:00 - 6:00 Выпито:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(d0006,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                              ]),
                              Row(children: [
                                Text('00:00 - 6:00 Выделено:',
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
                                SizedBox(width: 10),
                                Text(h0006,
                                    style: TextStyle(
                                        fontSize: 15, font: Font.ttf(data))),
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
