import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:the_be_hero/repositories/ong/OngRepository.dart';
import 'package:the_be_hero/routes/routes.dart';
import '../ong.model.dart';
import 'package:brasil_fields/brasil_fields.dart';


class InserirOng extends StatefulWidget {
  const InserirOng({Key? key}) : super(key: key);

  static const String routeName = '/inserirOng';

  @override
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

  void _consultaCep()async{
    try {
    final cep = _cepOngController.text;
    OngRepository repository = OngRepository();
    await repository.consultaCep(cep);
        setState((){
          _ruaOngController.text = repository.api.ruaController.value.text as String;
          _ruaOngController.text;
          });
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Cep invalido')));
    }
  }

  void _salvar() async {
    Ong ong = Ong.nova(
        _nomeOngController.text,
        _cnpjOngController.text,
        _emailOngController.text,
        _cepOngController.text,
        _ruaOngController.text,
        _numeroOngController.text,
        _compOngController.text,
        _numFixoOngController.text,
        _numMobileOngController.text,
        _descricaoOngController.text,
        _passwordOngController.text,
        _imageOngController.text);
    try {
      OngRepository repository = OngRepository();
      await repository.inserir(ong);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Ong Cadastrada com sucesso !! Pre cadastro concluido')));
      Navigator.pushNamed(context, AppRoutes.desculpatemporariaOng);
    } catch (exception) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error')));
    }
  }

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
                      keyboardType: TextInputType.text,
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
                        //verificar algo para formatar cnpj
                        keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CnpjInputFormatter(),
                      ],
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
                      keyboardType: TextInputType.emailAddress,
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
                      controller: _ruaOngController,
                      keyboardType: TextInputType.text,
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
                      keyboardType: TextInputType.number,
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
                      controller: _numFixoOngController,
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
                      controller: _descricaoOngController,
                      keyboardType: TextInputType.text,
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
