import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_be_hero/sing_up/voluntario/voluntario.model.dart';
import 'package:http/http.dart' as http;
import 'package:the_be_hero/rest/api.dart';

class VoluntarioRest{
  final ruaController= TextEditingController();

  Future<Voluntario> buscar(int id) async {
    final http.Response response =
    await http.get(Uri.http(API.endpoint, '/voluntarios/$id'));
    if (response.statusCode == 200) {
      return Voluntario.fromJson(response.body);
    } else {
      throw Exception(
          'Erro ao buscar Voluntario: ${id} [code: ${response.statusCode}]');
    }
  }

  Future<List<Voluntario>> buscarTodos() async {
    final http.Response response = await http
        .get(Uri.parse('${API.endpoint}/voluntarios'), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return Voluntario.fromJsonList(response.body);
    } else {
      throw Exception('Erro buscando todas as voluntarios.');
    }
  }

  Future<Voluntario> inserir(Voluntario voluntario) async {
    final http.Response response = await http
        .post(Uri.parse('${API.endpoint}/voluntarios'), body: voluntario.toJson(),
        headers: {
          "Accept": "*/*",
          "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return Voluntario.fromJson(response.body);
    } else {
      throw Exception('Erro inserir voluntario.');
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

