import 'package:flutter/material.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:the_be_hero/repositories/caso/CasoRepository.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';


import '../caso.model.dart';

class InserirCasoOng extends StatefulWidget {
  const InserirCasoOng({Key? key}) : super(key: key);

  static const String routeName = '/insereCasoDeOng';

  State<InserirCasoOng> createState() => _InserirCasoOngState();
}

class _InserirCasoOngState extends State<InserirCasoOng> {
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

  void _salvar() async {
    Caso caso = Caso.novo(
        _nomedoCasoController.text,
        _nomeOngController.text,
        _recaCasoController.text,
        _especieCasoController.text,
        _dtaRecolhidoCadoController.text,
        _descricaoCasoController.text,
        _imageCasoController.text,
        _cnpjCasoController.text.length,
        _emailCasoController.text,
        _cepCasoController.text.length,
        _ruaCasoController.text,
        _numeroCasoController.text.length,
        _compCasoController.text,
        _numFixoCasoController.text.length,
        _numMobileCasoController.text.length);

    try {
      CasoRepository repository = CasoRepository();
      await repository.inserir(caso);
      _nomedoCasoController.clear();
      _nomeOngController.clear();
      _recaCasoController.clear();
      _especieCasoController.clear();
      _dtaRecolhidoCadoController.clear();
      _descricaoCasoController.clear();
      _imageCasoController.clear();
      _cnpjCasoController.clear();
      _emailCasoController.clear();
      _cepCasoController.clear();
      _ruaCasoController.clear();
      _numeroCasoController.clear();
      _compCasoController.clear();
      _numFixoCasoController.clear();
      _numMobileCasoController.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Caso salvo com sucesso.')));
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error')));
    }
  }
  void _consultaCep()async{
    try {
      final cep = _cepCasoController.text;
      CasoRepository repository = CasoRepository();
      await repository.consultaCep(cep);
      setState((){
        _ruaCasoController.text = repository.api.ruaController.value.text as String;
        _ruaCasoController.text;
      });
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Cep invalido')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inserir caso ong"),
      ),
      drawer: Menu(),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: [
            Form(
              key: _formKeyCaso,
              child: Column(
                  children: [
                    Form(
                      child: Column(children: [
                        TextFormField(
                          autofocus: true,
                          controller: _nomedoCasoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo nao pode ser vazio';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Nome do caso",
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
                      ]),
                    ),
                    Form(
                      child: Column(children: [
                        TextFormField(
                          controller: _nomeOngController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo nao pode ser vazio';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Nome da ONG",
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
                      ]),
                    ),
                    Form(
                      child: Column(children: [
                        TextFormField(
                          controller: _cnpjCasoController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo nao pode ser vazio';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "CNPJ",
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
                      ]),
                    ),
                    Form(
                        child: Column(children: [
                      TextFormField(
                        controller: _recaCasoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo nao pode ser vazio';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Raca do animal",
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
                    ])),
                    Form(
                        child: Column(children: [
                      TextFormField(
                        controller: _especieCasoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo nao pode ser vazio';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Especie do animal",
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
                    ])),
                    Form(
                        child: Column(children: [
                      TextFormField(
                        controller: _dtaRecolhidoCadoController,
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter(),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo nao pode ser vazio';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Data do recolhimento",
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
                    ])),
                    Form(
                        child: Column(children: [
                      TextFormField(
                        controller: _descricaoCasoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo nao pode ser vazio';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Descrição do caso",
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
                    ])),
        Form(
            child: Column(children: [
              TextFormField(
                controller: _emailCasoController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo nao pode ser vazio';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Email",
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
            ])),
        Form(
            child: Column(children: [
              TextFormField(
                controller: _cepCasoController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return;
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

            ])),
        Form(
            child: Column(children: [
              TextFormField(
                controller: _ruaCasoController,
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return;
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
            ])),
        Form(
            child: Column(children: [
              TextFormField(
                controller: _numeroCasoController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return;
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Numero",
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
            ])),
                    Form(
                        child: Column(children: [
                          TextFormField(
                            controller: _compCasoController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return;
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
                        ])),
        Form(
            child: Column(children: [
              TextFormField(
                controller: _numFixoCasoController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return;
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
            ])),
                    Form(
                        child: Column(children: [
                          TextFormField(
                            controller: _numMobileCasoController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ;
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
                        ])),
                        Form(
                        child: Column(children: [
                      TextFormField(
                        controller: _imageCasoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo nao pode ser vazio';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "imagem",
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
                    ])),
                  ]),
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
                        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                        child: SizedBox(
                          child: Image.asset("assets/bone.png"),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    if (_formKeyCaso.currentState!.validate()) {
                      _salvar();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
