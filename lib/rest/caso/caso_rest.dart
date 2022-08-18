import 'package:the_be_hero/caso/caso.model.dart';
import 'package:the_be_hero/rest/api.dart';
import 'package:the_be_hero/sing_up/pagesOng/modelsOng/ong.model.dart';
import 'package:http/http.dart' as http;

class CasoRest{
  Future<Caso> buscar(int id) async{
      final http.Response response =
      await http.get(Uri.http(API.endpoint, '/casos/$id'));
      if(response.statusCode == 200){
        return Caso.fromJson(response.body);
      }else{
        throw Exception(
          'Erro ao buscar a Ong: ${id} [code: ${response.statusCode}]'
        );
      }
  }
  Future<List<Caso>> buscarTodos() async{
    final http.Response response = await http.get(Uri.http(API.endpoint, '/casos'));
    if(response.statusCode == 200){
      return Caso.fromJsonList(response.body);
    }else{
      throw Exception('Erro buscando todas as ongs.');
    }
  }

  Future<Caso> inserir(Caso caso) async {
    final http.Response response = await http.post(Uri.parse('${API.endpoint}/casos'),
      body: caso.toJson(),
        headers: {
          "Accept": "application/json",
          "content-type":"application/json"
        }
    );
    if(response.statusCode == 200)
    {
      return Caso.fromJson(response.body);
    }else{
      throw Exception('Erro inserir Ong.');
    }
  }
}