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
      'caso_id': this.id,
      'caso_nome': this.nome,
      'caso_raca': this.raca,
      'caso_especie': this.especie,
      'caso_dta_recolhimento': this.dta_recolhimento,
      'caso_descricao': this.descricao,
      'caso_image': this.image
    };
  }

  static Caso fromMap(Map<String, dynamic> map){
    return Caso(
      map['caso_id'],
      map['caso_nome'],
      map['caso_raca'],
      map['caso_especie'],
      map['caso_dta_recolhimento'],
      map['caso_descricao'],
      map['caso_image'],
    );
  }

  static List<Caso> fromMaps(List<Map<String, dynamic>> maps){
    return List.generate(maps.length, (i) {
      return Caso.fromMap(maps[i]);
    });
  }
}