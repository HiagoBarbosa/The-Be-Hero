import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_be_hero/caso/caso.model.dart';
import 'package:the_be_hero/rest/api.dart';
import 'package:http/http.dart' as http;

class CasoRest {
  final ruaController= TextEditingController();

  Future<Caso> buscar(int id) async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, '/casos/$id'));
    if (response.statusCode == 200) {
      return Caso.fromJson(response.body);
    } else {
      throw Exception(
          'Erro ao buscar a caso: ${id} [code: ${response.statusCode}]');
    }
  }

  ///ja esta buscando e listando no heroku e no postegres
  Future<List<Caso>> buscarTodos() async {
    final http.Response response = await http
        .get(Uri.parse('${API.endpoint}/casos'), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return Caso.fromJsonList(response.body);
    } else {
      throw Exception('Erro buscando todos os Casos.');
    }
  }

  ///ja esta inserindo no heroku e no postgres
  Future<Caso> inserir(Caso caso) async {
    final http.Response response = await http.post(
        Uri.parse('${API.endpoint}/casos'),
        body: caso.toJson(), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
        });
    if (response.statusCode == 200) {
      return Caso.fromJson(response.body);
    } else {
      throw Exception('Erro inserir Caso.');
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
