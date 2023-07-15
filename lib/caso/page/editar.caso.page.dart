import 'package:flutter/material.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:sqflite/sqflite.dart';

import '../caso.model.dart';

class EditarCasoOngPage extends StatefulWidget {
  static const String routeName = '/editarCasoDaOng';

  @override
  State<StatefulWidget> createState() => _EditarCasoOngPageState();
}

class _EditarCasoOngPageState extends State<EditarCasoOngPage> {
  final _formKeyCaso = GlobalKey<FormState>();
  final _nomedoCasoController = TextEditingController();
  final _nomeOngController = TextEditingController();
  final _recaCasoController = TextEditingController();
  final _especieCasoController = TextEditingController();
  final _dtaRecolhidoCadoController = TextEditingController();
  final _descricaoCasoController = TextEditingController();
  final _imageCasoController = TextEditingController();
  final _cnpjCasoController = TextEditingController();
  final _emailCasoController = TextEditingController();
  final _cepCasoController = TextEditingController();
  final _ruaCasoController = TextEditingController();
  final _numeroCasoController = TextEditingController();
  final _compCasoController = TextEditingController();
  final _numFixoCasoController = TextEditingController();
  final _numMobileCasoController = TextEditingController();
  int _id = 0;
  Caso? _caso;

  void dispose() {
    _nomedoCasoController.dispose();
    _nomeOngController.dispose();
    _recaCasoController.dispose();
    _especieCasoController.dispose();
    _dtaRecolhidoCadoController.dispose();
    _descricaoCasoController.dispose();
    _imageCasoController.dispose();
    _cnpjCasoController.dispose();
    _emailCasoController.dispose();
    _cepCasoController.dispose();
    _ruaCasoController.dispose();
    _numeroCasoController.dispose();
    _compCasoController.dispose();
    _numFixoCasoController.dispose();
    _numMobileCasoController.dispose();
    super.dispose();
  }

  void _obterCaso() async {
    _nomedoCasoController.text = this._caso!.nomedocaso;
    _nomeOngController.text = this._caso!.nomeong;
    _recaCasoController.text = this._caso!.raca;
    _especieCasoController.text = this._caso!.especie;
    _dtaRecolhidoCadoController.text = this._caso!.dta_recolhimento.toString();
    _descricaoCasoController.text = this._caso!.descricao;
    _imageCasoController.text = this._caso!.image;
    _cnpjCasoController.text = this._caso!.cnpj.toString();
    _emailCasoController.text = this._caso!.email;
    _cepCasoController.text = this._caso!.cep.toString();
    _ruaCasoController.text = this._caso!.rua;
    _numeroCasoController.text = this._caso!.numero.toString();
    _compCasoController.text = this._caso!.comp;
    _numFixoCasoController.text = this._caso!.numFixo.toString();
    _numMobileCasoController.text = this._caso!.numMobile.toString();
  }

  void _salvar() async { /// falta criar tela para nomedocaso e cnpj para baixo
    this._caso!.nomedocaso = _nomedoCasoController.text;
    this._caso!.nomeong = _nomeOngController.text;
    this._caso!.raca = _recaCasoController.text;
    this._caso!.especie = _especieCasoController.text;
    this._caso!.dta_recolhimento = _dtaRecolhidoCadoController.text;
    this._caso!.descricao = _descricaoCasoController.text;
    this._caso!.image = _imageCasoController.text;
    this._caso!.cnpj = _cnpjCasoController.text.length;
    this._caso!.email= _emailCasoController.text;
    this._caso!.cep = _cepCasoController.text.length;
    this._caso!.rua = _ruaCasoController.text;
    this._caso!.numero = _numeroCasoController.text.length;
    this._caso!.comp = _compCasoController.text;
    this._caso!.numFixo = _numFixoCasoController.text.length;
    this._caso!.numMobile = _numMobileCasoController.text.length;
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
                controller: _nomeOngController,
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
