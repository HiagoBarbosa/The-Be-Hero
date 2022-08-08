import 'dart:convert';

class Genero {
  int? id;
  String genero;

  Genero(this.id,
      this.genero);

  Map<String, dynamic> toMap() {
    return {
      'genero_id': this.id,
      'genero_genero': this.genero
    };
  }

  static Genero fromMap(Map<String, dynamic> map) {
    return Genero(
      map['genero_id'],
      map['genero_genero']
    );
  }


  static List<Genero> fromMaps(List<Map<String, dynamic>>maps){
    return List.generate(maps.length, (i) {
      return Genero.fromMap(maps[i]);
    });
  }

  static Genero fromJson(String j) => Genero.fromMap(jsonDecode(j));
  static List<Genero> fromJsonList(String j){
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Genero>((map) => Genero.fromMap(map)).toList();
  }
  String toJson() => jsonEncode(toMap());

}


class Voluntario{

  int? id;
  String nome;
  String cnpj;
  String email;
  String cep;
  String rua;
  int numero;
  String comp;
  int numFixo;
  int numMobile;
  String descricao;
  String password;
  String image;

  Voluntario(
      this.id,
      this.nome,
      this.cnpj,
      this.email,
      this.cep,
      this.rua,
      this.numero,
      this.comp,
      this.numFixo,
      this.numMobile,
      this.descricao,
      this.password,
      this.image
      );
  Voluntario.nova(
      this.nome,
      this.cnpj,
      this.email,
      this.cep,
      this.rua,
      this.numero,
      this.comp,
      this.numFixo,
      this.numMobile,
      this.descricao,
      this.password,
      this.image
      );
  Map<String, dynamic> toMap(){
    return{
      'voluntario_id': this.id,
      'voluntario_nome': this.nome,
      'voluntario_cnpj': this.cnpj,
      'voluntario_email': this.email,
      'voluntario_cep': this.cep,
      'voluntario_rua': this.rua,
      'voluntario_numero': this.numero,
      'voluntario_comp': this.comp,
      'voluntario_numFixo': this.numFixo,
      'voluntario_numMobile': this.numMobile,
      'voluntario_descricao': this.descricao,
      'voluntario_password': this.password,
      'voluntario_image': this.image};
  }

  static Voluntario fromMap(Map<String, dynamic> map){
    return Voluntario(
      map['voluntario_id'],
      map['voluntario_nome'],
      map['voluntario_cnpj'],
      map['voluntario_email'],
      map['voluntario_cep'],
      map['voluntario_rua'],
      map['voluntario_numero'],
      map['voluntario_comp'],
      map['voluntario_numFixo'],
      map['voluntario_numMobile'],
      map['voluntario_descricao'],
      map['voluntario_password'],
      map['voluntario_image']
    );
  }

  static List<Voluntario> fromMaps(List<Map<String, dynamic>>maps){
    return List.generate(maps.length, (i) {
      return Voluntario.fromMap(maps[i]);
    });
  }

  static Voluntario fromJson(String j) => Voluntario.fromMap(jsonDecode(j));
  static List<Voluntario> fromJsonList(String j){
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Voluntario>((map) => Voluntario.fromMap(map)).toList();
  }
  String toJson() => jsonEncode(toMap());

}