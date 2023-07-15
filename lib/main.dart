import 'package:flutter/material.dart';
import 'package:the_be_hero/caso/page/editar.caso.page.dart';
import 'package:the_be_hero/home/home.page.dart';
import 'package:the_be_hero/login/login.page.dart';
import 'package:the_be_hero/routes/routes.dart';
import 'package:the_be_hero/servicoVoluntarioEDoacoes/page/servicoVoluntarioEDoacao.page.dart';
import 'package:the_be_hero/sing_up/ong/page/descOng.dart';
import 'package:the_be_hero/sing_up/ong/page/ong.page.dart';
import 'package:the_be_hero/sing_up/ongOrVoluntario.dart';
import 'package:the_be_hero/sing_up/voluntario/page/descVoluntario.dart';
import 'package:the_be_hero/sing_up/voluntario/page/voluntario.page.dart';

import 'caso/page/caso.page.dart';
import 'caso/page/casos.page.dart';
import 'caso/page/listid.caso.page.dart';
import 'servicoVoluntarioEDoacoes/page/servicoVoluntarioEDoacoes.page.dart';

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
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => HomePage(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.singUpPageOngOrVoluntario: (context) => SingUpPageOngOrVoluntario(),
        AppRoutes.inserirOng: (context) => InserirOng(),
        AppRoutes.listaCasoDeOng: (context) => LitarCasosOng(),
        AppRoutes.inserirCasoOng: (context) => InserirCasoOng(),
        AppRoutes.editarCasoOng: (context) => EditarCasoOngPage(),
        AppRoutes.desculpatemporariaOng: (context) => DesculpasTemporariaOng(),
        AppRoutes.inserirVoluntario: (context) => InserirVoluntario(),
        AppRoutes.desculpastemporariaVoluntario:(context) => DesculpasTemporariaVoluntario(),
        AppRoutes.inserirservicoVoluntarioEDoacao:(context) => InserirservicoVoluntarioEDoacao(),
        AppRoutes.litarservicoVoluntarioEDoacoes:(context) => LitarservicoVoluntarioEDoacoes(),
        AppRoutes.listaCasoOngIdPage:(context) => ListaCasoOngIdPage()
      },
    );
  }
}
