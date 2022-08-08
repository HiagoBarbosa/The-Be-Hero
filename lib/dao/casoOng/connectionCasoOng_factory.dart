import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConnectionCasoOngFactory{
  final int _version = 1;
  final String _databaseFile = 'database.db';

  ConnectionCasoOngFactory._();
  static final ConnectionCasoOngFactory factory = ConnectionCasoOngFactory._();
  static Database? _database;

 Future<Database> get database async{
   if(_database != null){
     return _database!;
   }
   _database = await openDatabase(
     join(await getDatabasesPath(),_databaseFile),
     onCreate: _createDatanaseCasoOng,
     onUpgrade: _upgradeDatabaseCasoOng,
     version: _version,
   );
   return _database!;
 }
  _createDatanaseCasoOng(Database db, int version){
   return db.execute(
     "CREATE TABLE tb_casosOng(caso_id INTEGER PRIMARY KEY AUTOINCREMENT, "+ "caso_nome TEXT, caso_raca TEXT, caso_especie TEXT, caso_dta_recolhimento TEXT, caso_descricao TEXT,caso_image TEXT)",
   );
  }
  _upgradeDatabaseCasoOng(Database db, int oldVersion, int newVersion){
   db.execute("DROP TABLE tb_casosOng");
   return _createDatanaseCasoOng(db, _version);
  }
  close(){
   if(_database != null){
     _database!.close();
     _database = null;
   }
  }
}