import 'package:flutter/material.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:the_be_hero/repositories/ong/OngRepository.dart';
import 'package:the_be_hero/routes/routes.dart';

import '../ong.model.dart';

class InserirOng extends StatefulWidget {
  const InserirOng({Key? key}) : super(key: key);

  static const String routeName = '/inserirOng';

  State<InserirOng> createState() => _InserirOngState();
}

class _InserirOngState extends State<InserirOng> {
  final _formKeyOng = GlobalKey<FormState>();
  final _nomeOngController = TextEditingController();
  final _cnpjOngController = TextEditingController();
  final _emailOngController = TextEditingController();
  final _cepOngController = TextEditingController();
  final _ruaOngController = TextEditingController();
  final _numeroOngController = TextEditingController();
  final _compOngController = TextEditingController();
  final _numFixoOngController = TextEditingController();
  final _numMobileOngController = TextEditingController();
  final _descricaoOngController = TextEditingController();
  final _passwordOngController = TextEditingController();
  final _imageOngController = TextEditingController();

  void dispose() {
    _nomeOngController.dispose();
    _cnpjOngController.dispose();
    _emailOngController.dispose();
    _cepOngController.dispose();
    _ruaOngController.dispose();
    _numeroOngController.dispose();
    _compOngController.dispose();
    _numFixoOngController.dispose();
    _numMobileOngController.dispose();
    _descricaoOngController.dispose();
    _passwordOngController.dispose();
    _imageOngController.dispose();
  }

  void _salvar() async {
    Ong ong = Ong.nova(
        _nomeOngController.text,
        _cnpjOngController.text,
        _emailOngController.text,
        _cepOngController.text,
        _ruaOngController.text,
        _numeroOngController.hashCode,
        _compOngController.text,
        _numFixoOngController.hashCode,
        _numMobileOngController.hashCode,
        _descricaoOngController.text,
        _passwordOngController.text,
        _imageOngController.text);
    try {
      OngRepository repository = OngRepository();
      await repository.inserir(ong);
      _nomeOngController.clear();
      _cnpjOngController.clear();
      _emailOngController.clear();
      _cepOngController.clear();
      _ruaOngController.clear();
      _numeroOngController.clear();
      _compOngController.clear();
      _numFixoOngController.clear();
      _numMobileOngController.clear();
      _descricaoOngController.clear();
      _passwordOngController.clear();
      _imageOngController.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Ong Cadastrada com sucesso. Por favor faça login')));
      Navigator.pushNamed(context, AppRoutes.login);
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('errorrrrr')));
    }
  }

//precisa alterar essa merda esta quebrando o layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastre sua Ong"),
        ),
        drawer: Menu(),
        body: Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            child: ListView(children: [
              Form(
                key: _formKeyOng,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _nomeOngController,
                      autofocus: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Nome da Ong",
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
                      controller: _cnpjOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "CNPJ da Ong",
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
                      controller: _emailOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "E-mail Ong",
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
                      controller: _cepOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "CEP ong",
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
                      controller: _ruaOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Rua",
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
                      controller: _numeroOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
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
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _compOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
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
                      controller: _numFixoOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Numero Fixo",
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
                      controller: _numMobileOngController,
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
                      controller: _descricaoOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Descricao da Ong",
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
                      controller: _passwordOngController,
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
                    TextFormField(
                      controller: _imageOngController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Fotos da Ong",
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
                            if (_formKeyOng.currentState!.validate()) {
                              _salvar();
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }
}
