import 'dart:convert';

class Ongs {
  int? id;
  String nome;
  String email;


  Ongs(
      this.id,
      this.nome,
      this.email,

      );
  Ongs.nova(
      this.nome,
      this.email,
      );

  Map<String, dynamic> toMap(){
    return{
      'ong_id': this.id,
      'ong_nome': this.nome,
      'ong_email': this.email,

    };
  }

  static Ongs fromMap(Map<String, dynamic> map){
      return Ongs(
          map['ong_id'],
          map['ong_nome'],
          map['ong_email'],

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
