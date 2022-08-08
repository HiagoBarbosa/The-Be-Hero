import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_be_hero/routes/routes.dart';
import 'package:the_be_hero/sing_up/pagesVoluntario/modelsVoluntario/voluntario.model.dart';

import '../../menu/menu.component.dart';

class SingUpPageVoluntario extends StatefulWidget {
  const SingUpPageVoluntario({Key? key}) : super(key: key);

  static const String routeName = '/cadastraVoluntario';

  @override
  State<SingUpPageVoluntario> createState() => _SingUpPageVoluntario();
}

class _SingUpPageVoluntario extends State<SingUpPageVoluntario> {
  final _formKeySingupVoluntario = GlobalKey<FormState>();
  final _nomeVoluntarioController = TextEditingController();
  final _cpfVoluntarioController = TextEditingController();
  final _emailVoluntarioController = TextEditingController();
  final _cepVoluntarioController = TextEditingController();
  final _ruaController = TextEditingController();
  final _numVoluntarioController = TextEditingController();
  final _compVoluntarioController = TextEditingController();
  final _telFixoVoluntarioController = TextEditingController();
  final _telCelVoluntarioController = TextEditingController();
  final _descVoluntarioController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _confirmInputController = TextEditingController();
  final _imagVoluntarioPerfil = TextEditingController();
  //final _generoInputController= TextEditingController();

   Genero? _generoInputController;

//final Voluntario genero = ['a'] as Voluntario;
List<Genero> genero = <Genero> [Genero(0, "Selecione"), Genero(1, "Masculino"), Genero(3, "Feminino")];
  ///precisa ajeitar
  bool showPassword = false;
  @override
  void dispose() {
    _nomeVoluntarioController.dispose();
    _cpfVoluntarioController.dispose();
    _emailVoluntarioController.dispose();
    _cepVoluntarioController.dispose();
    _ruaController.dispose();
    _numVoluntarioController.dispose();
    _compVoluntarioController.dispose();
    _telFixoVoluntarioController.dispose();
    _telCelVoluntarioController.dispose();
    _descVoluntarioController.dispose();
    _passwordInputController.dispose();
    _confirmInputController.dispose();
    _imagVoluntarioPerfil.dispose();
    //_generoInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seja um Voluntario!'),
          actions: [
            IconButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.LOGIN);
                },
                icon: const Icon(Icons.account_circle_sharp))
          ],
        ),
        drawer: const Menu(),
        body: Container(
            padding: EdgeInsets.only(top: 10, left: 40, right: 40),
            color: Colors.white,
            child: ListView(children: <Widget>[
              Container(
                width: 200,
                height: 200,
                alignment: Alignment(0.0, 1.15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/profile-picture.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Container(
                  height: 56,
                  width: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1.0],
                      colors: [
                        Color(0xFFF58524),
                        Color(0XFFF92B7F),
                      ],
                    ),
                    border: Border.all(
                      width: 4.0,
                      color: const Color(0xFFFFFFFF),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(56),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: TextButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKeySingupVoluntario,
                child: Column(
                  children: [
                    TextFormField(
                      // validator: (value) => _validateForm(value),
                      controller: _nomeVoluntarioController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Nome do voluntario",
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

                    ///CNPJ PRECISA ARRUMAR A FORMATAÇÃO DO CNPJ
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _cpfVoluntarioController,
                      keyboardType: TextInputType.number,
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

                    ///EMAIL
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _emailVoluntarioController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    ///DA PARA UTILIZAR O VIA CEP PARA PUXAR INFORMAÇÕES RUA, DEPOIS PRECISA AJUSTAR A FORMATAÇÃO PARA CEP
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _cepVoluntarioController,
                      keyboardType: TextInputType.number,
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
                    //       ///VER SE DA PARA IMPORTAR OS DADOS DO CONFORME O CEP DIGITADO PARA FACILITAR A BUSCA E PREENCHER O CAMPO RUA
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _ruaController,
                      keyboardType: TextInputType.name,
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

                    ///NUMERO DA ONG NECESSARIO QUE O USUARIO DIGITE  CAMPO OBRIGATORIO
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _numVoluntarioController,
                      keyboardType: TextInputType.number,
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

                    ///CAMPO NAO OBRIGATORIO
                    TextFormField(
                      //validator: (value) => _validateForm(value),
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

                    ///NUM TELEFONE FIXO, FALTA AJUSTAR PARA QUE O USUARIO COLOQUE SEU DDD, COM VAI FUNCIONAR SO NO BRASIL 55+ TEM QUE FICAR FIXO CAMPO OBRIGATORIO
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _telFixoVoluntarioController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Telefone Fixo",
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

                    /// NUM CELULAR + WHATSAPP, FALTA AJUSTAR PARA QUE O USUARIO COLOQUE SEU DDD, COM VAI FUNCIONAR SO NO BRASIL 55+ TEM QUE FICAR FIXO CAMPO OBRIGATORIO
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _telCelVoluntarioController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Telefone Celular/Whatsapp",
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

                    ///GENERO
                    DropdownButton(
                      value: _generoInputController,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 30,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(height: 2, color: Colors.black38),
                      onChanged: (Genero? newValue) {
                        setState(() {
                          _generoInputController = newValue!;
                        });
                      },
                      items: genero.map<DropdownMenuItem<Genero>>(
                          (Genero genero) {
                        return DropdownMenuItem<Genero>(
                            value: genero, child: Text(genero.genero));
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    /// CAMPO OBRIGATORIO
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _descVoluntarioController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Descrição",
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

                    //       /// PAREI NA SENHA LINHA 141 DO PROJETO WEB
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return "A senha deve ter pelo menos 6 caracteres";
                        }
                        return null;
                      },
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == true) ? false : true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.black,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    (this.showPassword == false)
                        ? TextFormField(
                            validator: (value) {
                              if (value != _passwordInputController.text) {
                                return "As senhas devem ser iguais";
                              }
                              return null;
                            },
                            controller: _confirmInputController,
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              labelText: "Confirme a Senha",
                              labelStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              prefixIcon: Icon(
                                Icons.vpn_key_sharp,
                                color: Colors.white,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassword,
                          onChanged: (bool? newValue) {
                            setState(() {
                              this.showPassword = newValue!;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                        Text(
                          "Mostrar senha",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
