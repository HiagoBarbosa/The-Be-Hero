import 'package:the_be_hero/rest/caso/caso_rest.dart';

import '../../caso/caso.model.dart';

class CasoRepository {
  final CasoRest api = CasoRest();
  Future<Caso> buscar(int id) async {
    return await api.buscar(id);
  }

  Future<List<Caso>> buscarTodos() async {
    return await api.buscarTodos();
  }

  Future<Caso> inserir(Caso caso) async {
    return await api.inserir(caso);
  }
  // Future<Caso> alterar(Caso caso) async{return await api.alterar(caso);}
  // Future<Caso> remover(intid) async{return await api.remover(id);}

}
