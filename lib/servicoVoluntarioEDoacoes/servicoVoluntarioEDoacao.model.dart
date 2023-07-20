import 'dart:convert';


class ServicoVoluntarioEDoacao{
  int? id;
  String cep;
  String comp;
  String cpf;
  String descricao;
  String dta_disponibilidade;
  String email;
  String image;
  String nomedadoacao;
  String nomedovoluntario;
  String num_fixo;
  String num_mobile;
  String numero;
  String rua;
  String tipodo_voluntariado;

  ServicoVoluntarioEDoacao(
      this.id,
      this.cep,
      this.comp,
      this.cpf,
      this.descricao,
      this.dta_disponibilidade,
      this.email,
      this.image,
      this.nomedadoacao,
      this.nomedovoluntario,
      this.num_fixo,
      this.num_mobile,
      this.numero,
      this.rua,
      this.tipodo_voluntariado
      );
  ServicoVoluntarioEDoacao.novo(
      this.cep,
      this.comp,
      this.cpf,
      this.descricao,
      this.dta_disponibilidade,
      this.email,
      this.image,
      this.nomedadoacao,
      this.nomedovoluntario,
      this.num_fixo,
      this.num_mobile,
      this.numero,
      this.rua,
      this.tipodo_voluntariado
      );
  Map<String, dynamic> toMap(){
    return {
      "id": this.id,
      "cep":this.cep,
      "comp": this.comp,
      "cpf": this.cpf,
      "descricao": this.descricao,
      "dta_Disponibilidade": this.dta_disponibilidade,
      "email": this.email,
      "image": this.image,
      "nomedadoacao": this.nomedadoacao,
      "nomedovoluntario": this.nomedovoluntario,
      "numFixo": this.num_fixo,
      "numMobile": this.num_mobile,
      "numero": this.numero,
      "rua": this.rua,
      "tipodoVoluntariado": this.tipodo_voluntariado
    };
  }
  static ServicoVoluntarioEDoacao fromMap(Map<String,dynamic>map){
    return ServicoVoluntarioEDoacao(
      map['id'],
      map['cep'],
      map['comp'],
      map['cpf'],
      map['descricao'],
      map['dta_Disponibilidade'],
      map['email'],
      map['image'],
      map['nomedadoacao'],
      map['nomedovoluntario'],
      map['numFixo'],
      map['numMobile'],
      map['numero'],
      map['rua'],
      map['tipodoVoluntariado'],
    );
  }
  static List<ServicoVoluntarioEDoacao> fromMaps(List<Map<String, dynamic>> maps){
    return List.generate(maps.length, (i) {
      return ServicoVoluntarioEDoacao.fromMap(maps[i]);
    });
  }

  static ServicoVoluntarioEDoacao fromJson(String j) => ServicoVoluntarioEDoacao.fromMap(jsonDecode(j));
  static List<ServicoVoluntarioEDoacao>fromJsonList(String j){
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<ServicoVoluntarioEDoacao>((map)=>ServicoVoluntarioEDoacao.fromMap(map)).toList();
  }
  String toJson()=> jsonEncode(toMap());
}