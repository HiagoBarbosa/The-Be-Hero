import 'package:sqflite/sqflite.dart';
import 'package:the_be_hero/sing_up/ongs.model.dart';

class OngDAO {
  late Database database;

  OngDAO(this.database);

  Future<void> inserir (Ongs ongs) async {
    await database.insert("tb_ong", ongs.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Ongs>> obterTodos() async {
    final List<Map<String, dynamic>> maps = await database.query("tb_ong");
    return Ongs.fromMaps(maps);
  }

  Future<Ongs?> obterPorId(int id) async {
    final List<Map<String, dynamic>> maps =
        await database.query(
          "tb_ong",
          where: "id_ong = ?",
          whereArgs: [id]
        );
    if(maps.length > 0) {
      return Ongs.fromMap(maps.first);
    }
    return null;
  }

  Future<void> atualizar (Ongs ongs) async{
    await database.update(
      'tb_ong',
      ongs.toMap(),
      where: "id_ong = ?",
      whereArgs: [ongs.id],
    );
  }

  Future<void> remover(int id) async{
    await database.delete(
      'tb_ong',
      where: "id_ong = ?",
      whereArgs: [id],
    );
  }
}