import 'dart:convert';

class Ongs {
  int? id;
  String nome;
  //String cnpj;
  String email;
  // String cep;
  // String rua;
  // int numero;
  // String comp;
  // int numFixo;
  // int numMobile;
  // String descricao;
  // String password;
  //String image;

  Ongs(
      this.id,
      this.nome,
      // this.cnpj,
      this.email,
      // this.cep,
      // this.rua,
      // this.numero,
      // this.comp,
      // this.numFixo,
      // this.numMobile,
      // this.descricao,
      // this.password,
      //this.image
      );
  Ongs.nova(
      this.nome,
      //this.cnpj,
      this.email,
      //this.cep,
      //this.rua,
      //this.numero,
      //this.comp,
      //this.numFixo,
      //this.numMobile,
      //this.descricao,
      //this.password,
      //this.image
      );

  Map<String, dynamic> toMap(){
    return{
      'ong_id': this.id,
      'ong_nome': this.nome,
      //'ong_cnpj': this.cnpj,
      'ong_email': this.email,
      // 'ong_cep': this.cep,
      // 'ong_rua': this.rua,
      // 'ong_numero': this.numero,
      // 'ong_comp': this.comp,
      // 'ong_numFixo': this.numFixo,
      // 'ong_numMobile': this.numMobile,
      // 'ong_descricao': this.descricao,
      // 'ong_password': this.password,
      //'ong_image': this.image
    };
  }

  static Ongs fromMap(Map<String, dynamic> map){
      return Ongs(
          map['ong_id'],
          map['ong_nome'],
         // map['ong_cnpj'],
          map['ong_email'],
          // map['ong_cep'],
          // map['ong_rua'],
          // map['ong_numero'],
          // map['ong_comp'],
          // map['ong_numFixo'],
          // map['ong_numMobile'],
          // map['ong_descricao'],
          // map['ong_password']
          //map['ong_image']
          );
  }

  static List<Ongs> fromMaps(List<Map<String, dynamic>>maps){
    return List.generate(maps.length, (i) {
      return Ongs.fromMap(maps[i]);
    });
  }

  static Ongs fromJson(String j) => Ongs.fromMap(jsonDecode(j));
  static List<Ongs> fromJsonList(String j){
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Ongs>((map) => Ongs.fromMap(map)).toList();
  }
  String toJson() => jsonEncode(toMap());
}
