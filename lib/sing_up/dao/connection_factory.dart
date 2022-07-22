import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class ConnectionFactory {
  final int _version = 1;
  final String _databaseFile = "database.db";

  ConnectionFactory._();
  static final ConnectionFactory factory = ConnectionFactory._();
  static Database? _database;

  Future<Database?> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await openDatabase(
      join(await getDatabasesPath(), _databaseFile),
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
      version: _version,
    );
    return _database;

  }
  _createDatabase(Database db, int version) {
    //, ong_cep INTEGER, ong_rua TEXT, ong_numero INTEGER, ong_comp TEXT, ong_numFixo INTEGER, ong_numMobile INTEGER, ong_descricao TEXT, ong_password TEXT, ong_image TEXT
    return db.execute("CREATE TABLE tb_ongs (ong_id INTEGER PRIMARY KEY AUTOINCREMENT," + "ong_nome TEXT, ong_email TEXT)"
    );
  }
  _upgradeDatabase(Database db, int oldVersion, int newVersion) {
    db.execute("DROP TABLE tb_ongs");
    return _createDatabase(db, _version);
  }
  close(){
    if(_database != null){
      _database!.close();
      _database = null;
    }
  }
}

