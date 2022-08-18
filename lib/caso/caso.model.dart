import 'dart:convert';

class Caso{
  int? id;
  String nome;
  String raca;
  String especie;
  String dta_recolhimento; ///alterar para date time... sop para concluir logo isso aqui
  String descricao;
  String image;

  Caso(
      this.id,
      this.nome,
      this.raca,
      this.especie,
      this.dta_recolhimento,
      this.descricao,
      this.image
      );

  Caso.novo(
      this.nome,
      this.raca,
      this.especie,
      this.dta_recolhimento,
      this.descricao,
      this.image
      );

  Map<String, dynamic> toMap(){
    return {
      "id": this.id,
      "nome": this.nome,
      "raca": this.raca,
      "especie": this.especie,
      "dta_recolhimento": this.dta_recolhimento,
      "descricao": this.descricao,
      "image": this.image
    };
  }

  static Caso fromMap(Map<String, dynamic> map){
    return Caso(
      map['id'],
      map['nome'],
      map['raca'],
      map['especie'],
      map['dta_recolhimento'],
      map['descricao'],
      map['image'],
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