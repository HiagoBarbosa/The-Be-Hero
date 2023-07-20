import 'dart:convert';

class Caso{
  int? id;
  String nomedocaso;
  String nomeong;
  String raca;
  String especie;
  String dta_recolhimento; ///alterar para date time... sop para concluir logo isso aqui
  String descricao;
  String image;
  int cnpj;
  String email;
  int cep;
  String rua;
  int numero;
  String comp;
  int numFixo;
  int numMobile;

  Caso(
      this.id,
      this.nomedocaso,
      this.nomeong,
      this.raca,
      this.especie,
      this.dta_recolhimento,
      this.descricao,
      this.image,
      this.cnpj,
      this.email,
      this.cep,
      this.rua,
      this.numero,
      this.comp,
      this.numFixo,
      this.numMobile
      );

  Caso.novo(
      this.nomedocaso,
      this.nomeong,
      this.raca,
      this.especie,
      this.dta_recolhimento,
      this.descricao,
      this.image,
      this.cnpj,
      this.email,
      this.cep,
      this.rua,
      this.numero,
      this.comp,
      this.numFixo,
      this.numMobile
      );

  Map<String, dynamic> toMap(){
    return {
      "id": this.id,
      "nomedocaso": this.nomedocaso,
      "nomedaong": this.nomeong,
      "raca": this.raca,
      "especie": this.especie,
      "dta_recolhimento": this.dta_recolhimento,
      "descricao": this.descricao,
      "image": this.image,
      "cnpj": this.cnpj,
      "email":this.email,
      "cep":this.cep,
      "rua":this.rua,
      "numero": this.numero,
      "comp": this.comp,
      "numFixo":this.numFixo,
      "numMobile":this.numMobile
    };
  }

  static Caso fromMap(Map<String, dynamic> map){
    return Caso(
      map['id'],
      map['nomedocaso'],
      map['nomedaong'],
      map['raca'],
      map['especie'],
      map['dta_recolhimento'],
      map['descricao'],
      map['image'],
      map['cnpj'],
      map['email'],
      map['cep'],
      map['rua'],
      map['numero'],
      map['comp'],
      map['numFixo'],
      map['numMobile'],
    );
  }

  static List<Caso> fromMaps(List<Map<String, dynamic>> maps){
    return List.generate(maps.length, (i) {
      return Caso.fromMap(maps[i]);
    });
  }

  static Caso fromJson(String j) => Caso.fromMap(jsonDecode(j));
  static List<Caso>fromJsonList(String j){
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Caso>((map)=>Caso.fromMap(map)).toList();
  }
  String toJson()=> jsonEncode(toMap());
}