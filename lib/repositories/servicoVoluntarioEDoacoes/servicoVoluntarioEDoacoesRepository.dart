

import 'package:the_be_hero/servicoVoluntarioEDoacoes/servicoVoluntarioEDoacao.model.dart';

import '../../rest/servicoVoluntarioEDoacoes/servicoVoluntarioEDoacoes_rest.dart';

class ServicoVoluntarioEDoacoesRepository{

  final ServicoVoluntarioEDoacoesRest api = ServicoVoluntarioEDoacoesRest();
  Future<ServicoVoluntarioEDoacao> buscar(int id) async{
    return await api.buscar(id);
  }

  Future<List<ServicoVoluntarioEDoacao>> buscarTodos() async{
    return await api.buscarTodos();
  }

  Future<ServicoVoluntarioEDoacao> inserir(ServicoVoluntarioEDoacao servicoVoluntarioEDoacoes) async{
    return await api.inserir(servicoVoluntarioEDoacoes);
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