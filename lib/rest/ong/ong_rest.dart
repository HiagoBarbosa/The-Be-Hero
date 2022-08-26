import '../../sing_up/ong/ong.model.dart';
import 'package:the_be_hero/rest/api.dart';
import 'package:http/http.dart' as http;

class OngRest {
  Future<Ong> buscar(int id) async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, '/ongs/$id'));
    if (response.statusCode == 200) {
      return Ong.fromJson(response.body);
    } else {
      throw Exception(
          'Erro ao buscar Ong: ${id} [code: ${response.statusCode}]');
    }
  }

  Future<List<Ong>> buscarTodos() async {
    final http.Response response = await http
        .get(Uri.parse('${API.endpoint}/ongs'), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return Ong.fromJsonList(response.body);
    } else {
      throw Exception('Erro buscando todas as ongs.');
    }
  }

  Future<Ong> inserir(Ong ong) async {
    final http.Response response = await http
        .post(Uri.parse('${API.endpoint}/ongs'), body: ong.toJson(), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return Ong.fromJson(response.body);
    } else {
      throw Exception('Erro inserir Ong.');
    }
  }
}
