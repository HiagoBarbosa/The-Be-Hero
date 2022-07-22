import 'package:the_be_hero/rest/api.dart';

import '../sing_up/ongs.model.dart';
import'package:http/http.dart' as http;

class OngRest{
  Future<Ongs> buscar(int id) async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, '/ongs/$id'));
    if(response.statusCode == 200){
      return Ongs.fromJson(response.body);
    }else{
      throw Exception(
        'Erro busncado Ongs: ${id} [code: ${response.statusCode}]'
      );
    }
  }

  Future<List<Ongs>> buscarTodos() async {
    final http.Response response =
    await http.get(Uri.http(API.endpoint, 'ongs'));
    if (response.statusCode == 200) {
      return Ongs.fromJsonList(response.body);
    } else {
      throw Exception(
          'Erro buscar todas as ongs'
      );
    }
  }

  Future<Ongs> inserir(Ongs ong) async{
    final http.Response response = await http.post(Uri.http(API.endpoint, 'ong'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: ong.toJson()
    );

    if(response.statusCode == 201) {
      return Ongs.fromJson(response.body);
    }else{
      throw Exception('Erro inserido ong');
    }
  }

  // Future<Ongs> alterar(Ongs ong) async{
  //
  // }

  // Future<Ongs> remover(int id) async{
  //
  // }
}