import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Modular.to.pushReplacementNamed('/home/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInUp(
          child: Image.asset(
            'assets/logo.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
