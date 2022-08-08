import 'package:flutter/material.dart';
import 'package:the_be_hero/dao/casoOng/connectionCasoOng_factory.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:sqflite/sqflite.dart';


import '../../dao/casoOng/casoOng_dao.dart';
import '../../routes/routes.dart';
import '../caso.model.dart';

class LitarCasosOng extends StatefulWidget {
  static const String routeName = '/listaCasoDeOng';

  const LitarCasosOng({Key? key}) : super(key: key);

  @override
  State<LitarCasosOng> createState()=> _LitarCasosOngState();
}

class _LitarCasosOngState extends State<LitarCasosOng>{
  List<Caso> _lista = <Caso>[];

  @override
  void initState(){
    super.initState();
    _refreshList();
  }


  @override
  void dispose(){
    super.dispose();
  }

  void _refreshList() async{
    List<Caso> tempList = await _obterTodos();
    setState((){
      _lista = tempList;
    });
  }

  Future<List<Caso>> _obterTodos() async{
      Database db = await ConnectionCasoOngFactory.factory.database;
      casoOngDao dao = casoOngDao(db);

      List<Caso> tempLista = await dao.obterTodos();

      ConnectionCasoOngFactory.factory.close();

      return tempLista;
  }

  void _removerCaso(int id) async {
    Database db = await ConnectionCasoOngFactory.factory.database;
    casoOngDao dao = casoOngDao(db);
    await dao.remover(id);

    ConnectionCasoOngFactory.factory.close();
  }

  void _showItem(BuildContext context, int index){
    ///vai ter uma pagina so para lista o caso especifico

  }

  void _editItem(BuildContext context, int index){
      Caso c = _lista[index];

      Navigator.pushNamed(context, AppRoutes.editarCasoOng, arguments: <String, int>{
        "id": c.id!
      });
  }

  void _removeItem(BuildContext context, int index){
    Caso c  = _lista[index];
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      title: Text("Remover caso"),
      content: Text("Gostaria realmente de remover o caso ${c.nome} ?"),
      actions: [
        TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Não")),
        TextButton(onPressed: () {
          _removerCaso(c.id!);
          _refreshList();
          Navigator.of(context).pop();
        }, child: Text("Sim"))
      ],

    ));
  }

  ListTile _buildItem(BuildContext context, int index){
    Caso c = _lista[index];

    return ListTile(
      leading:Container(
        width: 60,
        height: 200,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(c.image),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      title: Text(c.nome),
      subtitle: Text(c.raca),
      onTap: () {_showItem(context, index);},
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(child: Text('Editar'), value: 'edit',),
            PopupMenuItem(child: Text('Remover'), value: 'delete',)
          ];
        },
        onSelected: (String value){
          if(value == 'edit')
            _editItem(context, index);
            else
            _removeItem(context, index);
        },

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Listagem dee casos"),
      ),
      drawer: const Menu(),
      body: ListView.builder(itemBuilder: _buildItem, itemCount: _lista.length,),
    );
  }
}
