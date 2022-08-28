import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/mobile/state/main_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer();
    });
    super.initState();
  }

  void timer() async {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      // var state = Provider.of<MainStateMobile>(context, listen: false);
      // state.getCurrentUser(context);
    });
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: const Text(
              'FERROCARRIL',
              style: TextStyle(
                fontFamily: "MontserratAlternates",
                inherit: false,
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var state = Provider.of<MainStateMobile>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 16, 23, 1),
      // body: state.authStatus == AuthStatus.NOT_DETERMINED
      //     ? _body()
      //     : state.authStatus == AuthStatus.NOT_LOGGED_IN
      //         ? LoginPage()
      //         : const HomePage());
      body: _body(),
    );
  }
}
