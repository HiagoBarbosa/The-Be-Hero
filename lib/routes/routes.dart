import '../caso/page/caso.page.dart';
import '../caso/page/casos.page.dart';
import '../caso/page/editar.caso.page.dart';

abstract class AppRoutes {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SING_UP_ONG = '/ong';
  //escolhe entre casos e voluntario
  static const SING_UP_ONG_OR_VOLUNTARIO= '/ong_or_voluntario';
  static const SING_UP_VOLUNTARIO= '/sing_up_voluntario';
///////////////////comeca a mudar as rotas depois alterar as antigas pra não dar pau
  //listas
  static const String listaCasoDeOng = LitarCasosOng.routeName;
  static const String inserirCasoOng = InserirCasoOng.routeName;
  static const String editarCasoOng = EditarCasoOngPage.routName;

}