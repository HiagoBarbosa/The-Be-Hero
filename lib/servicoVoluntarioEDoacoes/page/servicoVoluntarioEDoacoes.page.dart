import 'package:flutter/material.dart';
import 'package:the_be_hero/repositories/servicoVoluntarioEDoacoes/servicoVoluntarioEDoacoesRepository.dart';
import 'package:the_be_hero/servicoVoluntarioEDoacoes/servicoVoluntarioEDoacao.model.dart';
import '../../menu/menu.component.dart';

class LitarservicoVoluntarioEDoacoes extends StatefulWidget {
  static const String routeName = '/listaservicoVoluntarioEDoacao';

  const LitarservicoVoluntarioEDoacoes({Key? key}) : super(key: key);

  @override
  State<LitarservicoVoluntarioEDoacoes> createState()=> _LitarservicoVoluntarioEDoacoesState();
}

class _LitarservicoVoluntarioEDoacoesState extends State<LitarservicoVoluntarioEDoacoes>{
  List<ServicoVoluntarioEDoacao> _lista = <ServicoVoluntarioEDoacao>[];

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
    List<ServicoVoluntarioEDoacao> tempList = await _obterTodos();
    setState((){
      _lista = tempList;
    });
  }

  Future<List<ServicoVoluntarioEDoacao>> _obterTodos() async {
    List<ServicoVoluntarioEDoacao> tempLista = <ServicoVoluntarioEDoacao>[];
    try {
      ServicoVoluntarioEDoacoesRepository repository = ServicoVoluntarioEDoacoesRepository();
      tempLista = await repository.buscarTodos();
    }
    catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('errorrrrr')));
    }
    return tempLista;
  }
  void _showItem(BuildContext context, int index){
    ///vai ter uma pagina so para lista o caso especifico

  }
  //
  // void _editItem(BuildContext context, int index){
  //   ServicoVoluntarioEDoacao c = _lista[index];
  //
  //   Navigator.pushNamed(context, AppRoutes.editarCasoOng, arguments: <String, int>{
  //     "id": c.id!
  //   });
  // }

  void _removeItem(BuildContext context, int index){
    ServicoVoluntarioEDoacao c  = _lista[index];
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      title: Text("Remover caso"),
      content: Text("Gostaria realmente de remover o caso ${c.nomedovoluntario} ?"),
      actions: [
        TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Não")),
        TextButton(onPressed: () {
          //_removerCaso(c.id!);
          _refreshList();
          Navigator.of(context).pop();
        }, child: Text("Sim"))
      ],

    ));
  }

  ListTile _buildItem(BuildContext context, int index){
    ServicoVoluntarioEDoacao c = _lista[index];

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
      title: Text(c.nomedovoluntario),
      subtitle: Text(c.nomedadoacao),
      onTap: () {_showItem(context, index);},
      // trailing: PopupMenuButton(
      //   itemBuilder: (BuildContext context) {
      //     return [
      //       PopupMenuItem(child: Text('Editar'), value: 'edit',),
      //       PopupMenuItem(child: Text('Remover'), value: 'delete',)
      //     ];
      //   },
      //   onSelected: (String value){
      //     if(value == 'edit')
      //       _editItem(context, index);
      //     else
      //       _removeItem(context, index);
      //   },
      //
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Lista Servico Velutariado e Doacao"),
      ),
      drawer: const Menu(),
      body: ListView.builder(
        itemBuilder: _buildItem, itemCount: _lista.length,),
    );
  }
}