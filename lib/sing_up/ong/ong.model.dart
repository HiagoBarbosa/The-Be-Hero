import 'dart:convert';

class Ong {
  int? id;
  String nome;
  String cnpj;
  String email;
  String cep;
  String rua;
  String numero;
  String comp;
  String numFixo;
  String numMobile;
  String descricao;
  String password;
  String image;

  Ong(
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
  Ong.nova(
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
      'id': this.id,
      'nome': this.nome,
      'cnpj': this.cnpj,
      'email': this.email,
      'cep': this.cep,
      'rua': this.rua,
      'numero': this.numero,
      'comp': this.comp,
      'numFixo': this.numFixo,
      'numMobile': this.numMobile,
      'descricao': this.descricao,
      'password': this.password,
      'image': this.image
    };
  }

  static Ong fromMap(Map<String, dynamic> map){
    return Ong(
      map['id'],
      map['nome'],
      map['cnpj'],
      map['email'],
      map['cep'],
      map['rua'],
      map['numero'],
      map['comp'],
      map['numFixo'],
      map['numMobile'],
      map['descricao'],
      map['password'],
      map['image']
    );
  }

  static List<Ong> fromMaps(List<Map<String, dynamic>>maps){
    return List.generate(maps.length, (i) {
      return Ong.fromMap(maps[i]);
    });
  }

  static Ong fromJson(String j) => Ong.fromMap(jsonDecode(j));
  static List<Ong> fromJsonList(String j){
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Ong>((map) => Ong.fromMap(map)).toList();
  }
  String toJson() => jsonEncode(toMap());
}
