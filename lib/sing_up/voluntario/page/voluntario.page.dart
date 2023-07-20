import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:the_be_hero/routes/routes.dart';
import 'package:the_be_hero/sing_up/voluntario/voluntario.model.dart';
import 'package:brasil_fields/brasil_fields.dart';

import '../../../repositories/voluntario/VoluntarioRepository.dart';

class InserirVoluntario extends StatefulWidget {
  const InserirVoluntario({Key? key}) : super(key: key);

  static const String routeName = '/inserirVoluntario';

  @override
  State<InserirVoluntario> createState() => _InserirVoluntarioState();
}

class _InserirVoluntarioState extends State<InserirVoluntario> {
  final _formKeyVoluntario = GlobalKey<FormState>();
  final _nomeVoluntarioController = TextEditingController();
  final _emailVoluntarioController = TextEditingController();
  final _profissaoVoluntarioController = TextEditingController();
  final _rgVoluntarioController = TextEditingController();
  final _cpfVoluntarioController = TextEditingController();
  final _cepVoluntarioController = TextEditingController();
  final _ruaVoluntarioController = TextEditingController();
  final _numeroVoluntarioController = TextEditingController();
  final _compVoluntarioController = TextEditingController();
  final _numFixoVoluntarioController = TextEditingController();
  final _numMobileVoluntarioController = TextEditingController();
  final _descVoluntarioController = TextEditingController();
  final _passwordVoluntarioController = TextEditingController();
  final _imageVoluntarioController = TextEditingController();

  void dispose() {
    _nomeVoluntarioController.dispose();
    _emailVoluntarioController.dispose();
    _profissaoVoluntarioController.dispose();
    _rgVoluntarioController.dispose();
    _cpfVoluntarioController.dispose();
    _cepVoluntarioController.dispose();
    _ruaVoluntarioController.dispose();
    _numeroVoluntarioController.dispose();
    _compVoluntarioController.dispose();
    _numFixoVoluntarioController.dispose();
    _numMobileVoluntarioController.dispose();
    _descVoluntarioController.dispose();
    _passwordVoluntarioController.dispose();
    _imageVoluntarioController.dispose();
  }
  void _consultaCep()async{
    try {
      final cep = _cepVoluntarioController.text;
      VoluntarioRepository repository = VoluntarioRepository();
      await repository.consultaCep(cep);
      setState((){
        _ruaVoluntarioController.text = repository.api.ruaController.value.text as String;
        _ruaVoluntarioController.text;
      });
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Cep invalido')));
    }
  }
  void _salvar() async {
    Voluntario voluntario = Voluntario.nova(
        _nomeVoluntarioController.text,
        _emailVoluntarioController.text,
        _profissaoVoluntarioController.text,
        _rgVoluntarioController.text,
        _cpfVoluntarioController.text,
        _cepVoluntarioController.text,
        _ruaVoluntarioController.text,
        _numeroVoluntarioController.text,
        _compVoluntarioController.text,
        _numFixoVoluntarioController.text,
        _numMobileVoluntarioController.text,
        _descVoluntarioController.text,
        _passwordVoluntarioController.text,
        _imageVoluntarioController.text);
    try {
      VoluntarioRepository repository = VoluntarioRepository();
      await repository.inserir(voluntario);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Voluntario Cadastrado com sucesso. Pre cadastro concluido')));
      Navigator.pushNamed(context, AppRoutes.desculpastemporariaVoluntario);
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar Voluntario"),
        ),
        drawer: Menu(),
        body: Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            child: ListView(children: [
              Form(
                key: _formKeyVoluntario,
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: _nomeVoluntarioController,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                  decoration: InputDecoration(
                      labelText: "Nome do Voluntario",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                  TextFormField(
                    controller: _emailVoluntarioController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "E-mail Voluntario",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _profissaoVoluntarioController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Profissão",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _rgVoluntarioController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Rg",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _cpfVoluntarioController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "CPF",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _cepVoluntarioController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "CEP",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFFF58524),
                          Color(0XFFF92B7F),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Buscar CEP",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        onPressed: () {
                          _consultaCep();
                        },
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _ruaVoluntarioController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Nome da Rua",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _numeroVoluntarioController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Numero Residencial",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  TextFormField(
                    controller: _compVoluntarioController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Complemento",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _numFixoVoluntarioController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Numero fixo (residencial)",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _numMobileVoluntarioController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Numero Celular",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _imageVoluntarioController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Fotos do Voluntario o doação",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _descVoluntarioController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Complemento",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordVoluntarioController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        )),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFFF58524),
                          Color(0XFFF92B7F),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Salvar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 40, right: 40),
                              child: SizedBox(
                                child: Image.asset("assets/bone.png"),
                                height: 28,
                                width: 28,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          if (_formKeyVoluntario.currentState!.validate()) {
                            _salvar();
                          }
                        },
                      ),
                    ),
                  )

                ]),
              ),
            ])));
  }
}
