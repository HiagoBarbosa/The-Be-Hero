import 'package:flutter/material.dart';
import 'package:the_be_hero/home/home.page.dart';
import 'package:the_be_hero/login/login.page.dart';
import 'package:the_be_hero/routes/routes.dart';
import 'package:the_be_hero/sing_up/ongOrVoluntario.dart';
import 'package:the_be_hero/sing_up/pagesOng/sign_up.pageOng.dart';

import 'caso/page/caso.page.dart';
import 'caso/page/casos.page.dart';
import 'sing_up/pagesVoluntario/sign_up.pagesVoluntario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (_) => const HomePage(),
        AppRoutes.LOGIN: (_) => const LoginPage(),
        AppRoutes.SING_UP_ONG_OR_VOLUNTARIO:(_) => const SingUpPageOngOrVoluntario(),
        AppRoutes.SING_UP_ONG: (_) => const SingUpPageOng(),
        AppRoutes.SING_UP_VOLUNTARIO: (_) => const SingUpPageVoluntario(),
        AppRoutes.listaCasoDeOng: (context) => LitarCasosOng(),
        AppRoutes.inserirCasoOng: (context) => InserirCasoOng(),
      },
    );
  }
}
