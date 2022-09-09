import 'package:cardio_expert/ui/mobile/home/home.dart';
import 'package:flutter/material.dart';

import '../home/helper/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 36),
                    child: Image.asset('assets/img/MedicalRecord.png',
                        height: 200, width: 200),
                  ),
                  const Text(
                    'Добро пожаловать\nПользователь !',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        bottom: 16, top: 20, left: 40, right: 40),
                    child: Text(
                      'Здоровый человек должен следить за своим здоровьем и своими показателями, а человек, страдающий хроническими сердечно-сосудистыми заболеваниями обязан.\nЭто приложение является вашим дневником самоконтроля, куда вы можете вносить свои показатели, а также найти информационные материалы.',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 35),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage())),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(255, 98, 98, 1)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 55)),
                ),
                child: const Text('Дневник самоконтроля',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HelperPage())),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(148, 148, 148, 1)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 55)),
                ),
                child: const Text('Информационные материалы',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
          ),
        ]),
      ),
    );
  }
}
