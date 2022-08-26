import 'package:the_be_hero/home/home.page.dart';
import 'package:the_be_hero/login/login.page.dart';
import 'package:the_be_hero/sing_up/ongOrVoluntario.dart';

import '../caso/page/caso.page.dart';
import '../caso/page/casos.page.dart';
import '../caso/page/editar.caso.page.dart';
import '../sing_up/ong/page/ong.page.dart';


abstract class AppRoutes {
  static const home = HomePage.routeName;
  static const login = LoginPage.routeName;
  static const String singUpPageOngOrVoluntario = SingUpPageOngOrVoluntario.routeName;
  static const String inserirOng = InserirOng.routeName;
  static const String listaCasoDeOng = LitarCasosOng.routeName;
  static const String inserirCasoOng = InserirCasoOng.routeName;
  static const String editarCasoOng = EditarCasoOngPage.routeName;

}