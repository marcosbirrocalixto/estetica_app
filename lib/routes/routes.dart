import 'package:flutter/material.dart';

import '../../pages/splash/splash_screen.dart';
import '../../pages/login/login_page.dart';
import '../../pages/ordens/ordens_page.dart';
import '../../pages/servicos/serv_page.dart';
import '../../pages/evaluation/evaluation_page.dart';
import '../../pages/profile/profile_page.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    '/home': (context) => SplashScreen(),
    '/placa': (context) => const LoginPage(),
    '/ordem': (context) => const OrdemPage(placa: ''),
    '/servico': (context) => const ServicosPage(),
    '/evaluation-order': (context) => const EvaluationPage(),
    '/profile': (context) => const ProfilePage(),
  };
}
