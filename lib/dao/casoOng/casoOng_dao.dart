import 'package:the_be_hero/caso/caso.model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class casoOngDao{
Database database;

casoOngDao(this.database);

Future<void> inserir(Caso caso) async{
  await database.insert(
    "tb_casosOng",
    caso.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
Future<List<Caso>> obterTodos() async{ 
  final List<Map<String,dynamic>> maps = await database.query("tb_casosOng");
  return Caso.fromMaps(maps);
}
Future<Caso?> obterPorId(int id) async{
  final List<Map<String,dynamic>> maps = await database.query("tb_casosOng", where: "caso_id = ?", whereArgs: [id]);
  if(maps.length > 0){
    return Caso.fromMap(maps.first);
  }
  return null;
}
Future<void> atualizar(Caso caso) async{
  await database.update("tb_casosOng", caso.toMap(),where: "caso_id = ?", whereArgs: [caso.id]);
}
Future<void> remover(int id) async{
  await database.delete(
      "tb_casosOng",where: "caso_id = ?", whereArgs: [id]
  );
}
}