import 'dart:convert';

import 'package:flutter/material.dart';

import '../../sing_up/ong/ong.model.dart';
import 'package:the_be_hero/rest/api.dart';
import 'package:http/http.dart' as http;

class OngRest {
  final ruaController= TextEditingController();

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
        .post(Uri.parse('${API.endpoint}/ongs'),
        body: ong.toJson(), headers: {
      "Accept": "*/*",
      "content-type": "application/json"
    });
    if (response.statusCode == 200) {
      return Ong.fromJson(response.body);
    } else {
      throw Exception('Erro inserir Ong.');
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
