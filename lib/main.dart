import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../constantes/app_theme.dart';
import '../../pages/splash/splash_screen.dart';


void main() {
  runApp(FlutterDetalheApp());
}

class FlutterDetalheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Detalhe Estética Automotiva",
      theme: themeData,
      initialRoute: '/home',
      routes: Routes.routes,
      home: SplashScreen(),
    );
  }
}
