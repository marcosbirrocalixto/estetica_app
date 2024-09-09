import 'package:flutter/material.dart';
import '../login/login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((_) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });


    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 350,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          Container(height: 2),
          const CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 231, 234, 143),
            valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 224, 178, 111)),
          ),
          Container(height: 20),
          const Text('Carregando...',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    ));
  }
}
