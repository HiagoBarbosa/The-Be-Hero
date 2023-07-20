import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:the_be_hero/rest/api.dart';
import 'package:http/http.dart' as http;
import 'package:the_be_hero/servicoVoluntarioEDoacoes/servicoVoluntarioEDoacao.model.dart';

class ServicoVoluntarioEDoacoesRest {
  final ruaController= TextEditingController();

  Future<ServicoVoluntarioEDoacao> buscar(int id) async {
    final http.Response response =
    await http.get(Uri.http(API.endpoint, '/servicosVoluntariosEDoacoes/$id'));
    if (response.statusCode == 200) {
      return ServicoVoluntarioEDoacao.fromJson(response.body);
    } else {
      throw Exception(
          'Erro ao buscar a voluntario ou doação: ${id} [code: ${response.statusCode}]');
    }
  }

  ///ja esta buscando e listando no heroku e no postegres
  Future<List<ServicoVoluntarioEDoacao>> buscarTodos() async {
    final http.Response response = await http
        .get(Uri.parse('${API.endpoint}/servicosVoluntariosEDoacoes'), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return ServicoVoluntarioEDoacao.fromJsonList(response.body);
    } else {
      throw Exception('Erro buscando voluntarios ou doações.');
    }
  }

  ///ja esta inserindo no heroku e no postgres
  Future<ServicoVoluntarioEDoacao> inserir(ServicoVoluntarioEDoacao servicoVoluntarioEDoacao) async {
    final http.Response response = await http.post(
        Uri.parse('${API.endpoint}/servicosVoluntariosEDoacoes'),
        body: servicoVoluntarioEDoacao.toJson(), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return ServicoVoluntarioEDoacao.fromJson(response.body);
    } else {
      throw Exception('Erro inserir servicos Voluntarios e Doacao.');
    }
  }
  Future<String> consultaCep(String cep) async{
    var notp = cep.replaceAll(r'.','');
    var ceps = notp.replaceAll(r'-', '');
    http.Response response = await http.get(Uri.parse('${API.viacep}/${ceps}/json/'));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    if(response.statusCode==200){
      ruaController.text = "${logradouro}";
      return ruaController.text;
    }else{
      throw Exception(
          'cep invalido'
      );
    }
  }
}
