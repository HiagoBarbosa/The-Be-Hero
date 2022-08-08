import 'package:flutter/material.dart';
import 'package:the_be_hero/dao/casoOng/casoOng_dao.dart';
import 'package:the_be_hero/dao/casoOng/connectionCasoOng_factory.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:sqflite/sqflite.dart';

import '../caso.model.dart';

class EditarCasoOngPage extends StatefulWidget {
  static const String routName = '/editarCasoDaOng';

  @override
  State<StatefulWidget> createState() => _EditarCasoOngPageState();
}

class _EditarCasoOngPageState extends State<EditarCasoOngPage> {
  final _formKeyCaso = GlobalKey<FormState>();
  final _nomeCasoController = TextEditingController();
  final _recaCasoController = TextEditingController();
  final _especieCasoController = TextEditingController();
  final _dtaRecolhidoCadoController = TextEditingController();
  final _descricaoCasoController = TextEditingController();
  final _imageCasoController = TextEditingController();
  int _id = 0;
  Caso? _caso;

  void dispose() {
    _nomeCasoController.dispose();
    _recaCasoController.dispose();
    _especieCasoController.dispose();
    _dtaRecolhidoCadoController.dispose();
    _descricaoCasoController.dispose();
    _imageCasoController.dispose();
    super.dispose();
  }

  void _obterCaso() async {
    Database db = await ConnectionCasoOngFactory.factory.database;
    casoOngDao dao = casoOngDao(db);
    this._caso = await dao.obterPorId(this._id);
    ConnectionCasoOngFactory.factory.close();

    _nomeCasoController.text = this._caso!.nome;
    _recaCasoController.text = this._caso!.raca;
    _especieCasoController.text = this._caso!.especie;
    _dtaRecolhidoCadoController.text = this._caso!.dta_recolhimento.toString();
    _descricaoCasoController.text = this._caso!.descricao;
    _imageCasoController.text = this._caso!.image;
  }

  void _salvar() async {
    this._caso!.nome = _nomeCasoController.text;
    this._caso!.raca = _recaCasoController.text;
    this._caso!.especie = _especieCasoController.text;
    this._caso!.dta_recolhimento =
        _dtaRecolhidoCadoController.text;
    this._caso!.descricao = _descricaoCasoController.text;
    this._caso!.image = _imageCasoController.text;

    Database db = await ConnectionCasoOngFactory.factory.database;
    casoOngDao dao =casoOngDao(db);
    await dao.atualizar(this._caso!);
    ConnectionCasoOngFactory.factory.close();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Ong editado com sucesso.')));
  }

  @override
  Widget _buildForm(BuildContext context) {
    return Column(children: [
      Form(
          key: _formKeyCaso,
          child: ListView(shrinkWrap: true, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Nome do caso:"),
              Expanded(
                  child: TextFormField(
                controller: _nomeCasoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Idade:"),
              Expanded(
                  child: TextFormField(
                controller: _recaCasoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Idade:"),
              Expanded(
                  child: TextFormField(
                controller: _especieCasoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Idade:"),
              Expanded(
                  child: TextFormField(
                controller: _dtaRecolhidoCadoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Idade:"),
              Expanded(
                  child: TextFormField(
                controller: _descricaoCasoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Idade:"),
              Expanded(
                  child: TextFormField(
                controller: _imageCasoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            ElevatedButton(
              onPressed: () {
                if (_formKeyCaso.currentState!.validate()) {
                  _salvar();
                }
              },
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
          ])) // Form
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Map m = ModalRoute.of(context)!.settings.arguments as Map;
    this._id = m["id"];
    _obterCaso();
    return new Scaffold(
      appBar: AppBar(
        title: Text("Editar Ong"),
      ),
      drawer: Menu(),
      body: _buildForm(context),
    );
  }
}
