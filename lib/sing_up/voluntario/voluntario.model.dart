import 'dart:convert';

class Voluntario {
  int? id;
  String nomeVoluntario;
  String emailVoluntario;
  String profissao;
  String rg;
  String cpf;
  String cep;
  String rua;
  String numero;
  String comp;
  String numFixo;
  String numMobile;
  String descricao;
  String password;
  String image;

  Voluntario(
      this.id,
      this.nomeVoluntario,
      this.emailVoluntario,
      this.profissao,
      this.rg,
      this.cpf,
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
        this.nomeVoluntario,
        this.emailVoluntario,
        this.profissao,
        this.rg,
        this.cpf,
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
        'nomeVoluntario': this.nomeVoluntario,
        'emailVoluntario':this.emailVoluntario,
        'profissao':this.profissao,
        'rg':this.rg,
        'cpf':this.cpf,
        'cep':this.cep,
        'rua':this.rua,
        'numero':this.numero,
        'comp':this.comp,
        'numFixo':this.numFixo,
        'numMobile':this.numMobile,
        'descricao':this.descricao,
        'password':this.password,
        'image':this.image
      };
    }
    static Voluntario fromMap(Map<String, dynamic> map){
      return Voluntario(
          map['id'],
          map['nomeVoluntario'],
          map['emailVoluntario'],
          map['profissao'],
          map['rg'],
          map['cpf'],
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

    static List<Voluntario> fromMaps(List<Map<String,dynamic>>maps){
      return List.generate(maps.length, (i){
        return Voluntario.fromMap(maps[i]);
      });
    }

    static Voluntario fromJson(String j)=> Voluntario.fromMap(jsonDecode(j));
    static List<Voluntario> fromJsonList(String j){
      final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
      return parsed.map<Voluntario>((map) => Voluntario.fromMap(map)).toList();
    }
    String toJson() => jsonEncode(toMap());
}