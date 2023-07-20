import 'package:the_be_hero/rest/ong/ong_rest.dart';

import '../../sing_up/ong/ong.model.dart';

class OngRepository {
    final OngRest api = OngRest();
    Future<Ong> buscar(int id) async{
        return await api.buscar(id);
    }

    Future<List<Ong>> buscarTodos() async{
        return await api.buscarTodos();
    }

    Future<Ong> inserir(Ong ong) async{
        return await api.inserir(ong);
    }

    Future<String> consultaCep(String cep) async{
        return  api.consultaCep(cep);
    }

    //Future<Ong> alterar(Ong ong) async{
     //return await api.alterar(ong);
    //}
    //Future<Ong> remover (int id) async{
      //  return await api.remover(id);
    //}
}