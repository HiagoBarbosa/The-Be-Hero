import '../../rest/voluntario/voluntario_rest.dart';
import '../../sing_up/voluntario/voluntario.model.dart';

class VoluntarioRepository{
  final VoluntarioRest api = VoluntarioRest();
  Future<Voluntario> buscar(int id) async{
    return await api.buscar(id);
  }

  Future<List<Voluntario>> buscarTodos() async{
    return await api.buscarTodos();
  }

  Future<Voluntario> inserir(Voluntario voluntario) async{
    return await api.inserir(voluntario);
  }
  Future<String> consultaCep(String cep) async{
    return  api.consultaCep(cep);
  }
  // Future<Voluntario> alterar(Voluntario voluntario) async{
  //   return await api.alterar(voluntario);
  // }
  // Future<Voluntario> remover(int id) async{
  //   return await api.remover(id);
  // }
}