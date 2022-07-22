import 'package:the_be_hero/helper/ong_rest.dart';
import 'package:the_be_hero/sing_up/ongs.model.dart';

class OngRepository {
  final OngRest api= OngRest();
  Future<Ongs> buscar(int id) async {
    return await api.buscar(id);
  }

  Future<List<Ongs>> buscarTodos() async{
    return await api.buscarTodos();
  }
  Future<Ongs> inserir(Ongs ong) async{
    return await api.inserir(ong);
  }
  // Future<Ongs> alterar(Ongs ong) async{
  //   return await api.alterar(ong);
  // }
  // Future<Ongs> remover(int id) async{
  //   return await api.remover(id);}
}