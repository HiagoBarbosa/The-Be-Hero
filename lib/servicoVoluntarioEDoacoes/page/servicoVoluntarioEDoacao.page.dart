import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../menu/menu.component.dart';
import '../../repositories/servicoVoluntarioEDoacoes/servicoVoluntarioEDoacoesRepository.dart';
import 'package:brasil_fields/brasil_fields.dart';

import '../servicoVoluntarioEDoacao.model.dart';


class InserirservicoVoluntarioEDoacao extends StatefulWidget {
  const InserirservicoVoluntarioEDoacao({Key? key}) : super(key: key);

  static const String routeName = '/InserirservicoVoluntarioEDoacao';

  State<InserirservicoVoluntarioEDoacao> createState() => _InserirservicoVoluntarioEDoacaoState();
}

class _InserirservicoVoluntarioEDoacaoState extends State<InserirservicoVoluntarioEDoacao> {
  final _formKeyServicoVoluntarioEDoacao = GlobalKey<FormState>();
  final _cepController = TextEditingController();
  final _compController = TextEditingController();
  final _cpfCasoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _dta_disponibilidadeController = TextEditingController();
  final _emailController = TextEditingController();
  final _imageController = TextEditingController();
  final _nomedadoacaoController = TextEditingController();
  final _nomedovoluntarioController = TextEditingController();
  final _num_fixoController = TextEditingController();
  final _num_mobileController = TextEditingController();
  final _numeroController = TextEditingController();
  final _ruaController = TextEditingController();
  final _tipodo_voluntariadoController = TextEditingController();

  void dispose() {
    _cepController.dispose();
    _compController.dispose();
    _cpfCasoController.dispose();
    _descricaoController.dispose();
    _dta_disponibilidadeController.dispose();
    _emailController.dispose();
    _imageController.dispose();
    _nomedadoacaoController.dispose();
    _nomedovoluntarioController.dispose();
    _num_fixoController.dispose();
    _num_mobileController.dispose();
    _numeroController.dispose();
    _ruaController.dispose();
    _tipodo_voluntariadoController.dispose();
    super.dispose();
  }

  void _salvar() async {
  ServicoVoluntarioEDoacao servicoVoluntarioEDoacao = ServicoVoluntarioEDoacao.novo(
    _cepController.text,
    _compController.text,
    _cpfCasoController.text,
    _descricaoController.text,
    _dta_disponibilidadeController.text,
    _emailController.text,
    _imageController.text,
    _nomedadoacaoController.text,
    _nomedovoluntarioController.text,
    _num_fixoController.text,
    _num_mobileController.text,
    _numeroController.text,
    _ruaController.text,
    _tipodo_voluntariadoController.text);
    try {
      ServicoVoluntarioEDoacoesRepository repository = ServicoVoluntarioEDoacoesRepository();
      await repository.inserir(servicoVoluntarioEDoacao);
      _cepController.clear();
      _compController.clear();
      _cpfCasoController.clear();
      _descricaoController.clear();
      _dta_disponibilidadeController.clear();
      _emailController.clear();
      _imageController.clear();
      _nomedadoacaoController.clear();
      _nomedovoluntarioController.clear();
      _num_fixoController.clear();
      _num_mobileController.clear();
      _numeroController.clear();
      _ruaController.clear();
      _tipodo_voluntariadoController.clear();
            ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Servico Voluntario ou Doacao salvo com sucesso.')));
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error')));
    }
  }

  void _consultaCep()async{
    try {
      final cep = _cepController.text;
      ServicoVoluntarioEDoacoesRepository repository = ServicoVoluntarioEDoacoesRepository();
      await repository.consultaCep(cep);
      setState((){
        _ruaController.text = repository.api.ruaController.value.text as String;
        _ruaController.text;
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
          title: Text("inserir servicos voluntario ou doacao", style: TextStyle(fontSize: 18
          ),),
        ),
        drawer: Menu(),
        body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
    child: ListView(
    children: [
      Form(
        key: _formKeyServicoVoluntarioEDoacao,
        child: Column(
            children: [
              Form(
                child: Column(children: [
                  TextFormField(
                    autofocus: true,
                    controller: _nomedadoacaoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo nao pode ser vazio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Nome da Doacao",
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
                    controller: _nomedovoluntarioController,
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
                ]),
              ),
              Form(
                child: Column(children: [
                  TextFormField(
                    controller: _dta_disponibilidadeController,
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
                        labelText: "Data de disponibilidade do voluntario",
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "email",
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
                      controller: _cpfCasoController,
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
                  ])),
              Form(
                  child: Column(children: [
                    TextFormField(
                      controller: _cepController,
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
              Form(
                  child: Column(children: [
                    TextFormField(
                      controller: _ruaController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Nome da rua",
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
                      controller: _numeroController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Numero residencial",
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
                      controller: _num_fixoController,
                      keyboardType: TextInputType.number,
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
                  ])),
              Form(
                  child: Column(children: [
                    TextFormField(
                  controller: _num_mobileController,
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
                      controller: _descricaoController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Descricao",
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
                      controller: _compController,
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
                      controller: _tipodo_voluntariadoController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Tipo de voluntariado",
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
                      controller: _imageController,
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
              if (_formKeyServicoVoluntarioEDoacao.currentState!.validate()) {
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
