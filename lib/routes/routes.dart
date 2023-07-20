import 'package:the_be_hero/home/home.page.dart';
import 'package:the_be_hero/login/login.page.dart';
import 'package:the_be_hero/servicoVoluntarioEDoacoes/page/servicoVoluntarioEDoacoes.page.dart';
import 'package:the_be_hero/sing_up/ong/page/descOng.dart';
import 'package:the_be_hero/sing_up/ongOrVoluntario.dart';

import '../caso/page/caso.page.dart';
import '../caso/page/casos.page.dart';
import '../caso/page/editar.caso.page.dart';
import '../caso/page/listid.caso.page.dart';
import '../servicoVoluntarioEDoacoes/page/servicoVoluntarioEDoacao.page.dart';
import '../sing_up/ong/page/ong.page.dart';
import '../sing_up/voluntario/page/descVoluntario.dart';
import '../sing_up/voluntario/page/voluntario.page.dart';


abstract class AppRoutes {
  static const home = HomePage.routeName;
  static const login = LoginPage.routeName;
  static const String singUpPageOngOrVoluntario = SingUpPageOngOrVoluntario.routeName;
  static const String inserirOng = InserirOng.routeName;
  static const String listaCasoDeOng = LitarCasosOng.routeName;
  static const String inserirCasoOng = InserirCasoOng.routeName;
  static const String editarCasoOng = EditarCasoOngPage.routeName;
  static const String desculpatemporariaOng = DesculpasTemporariaOng.routeName;
  static const String inserirVoluntario = InserirVoluntario.routeName;
  static const String desculpastemporariaVoluntario = DesculpasTemporariaVoluntario.routeName;
  static const String inserirservicoVoluntarioEDoacao = InserirservicoVoluntarioEDoacao.routeName;
  static const String litarservicoVoluntarioEDoacoes = LitarservicoVoluntarioEDoacoes.routeName;
  static const String listaCasoOngIdPage = ListaCasoOngIdPage.routeName;

}