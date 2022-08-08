import 'package:flutter/material.dart';
import 'package:the_be_hero/repositories/ong_repository.dart';
import 'package:the_be_hero/routes/routes.dart';
import 'package:the_be_hero/sing_up/pagesOng/daoOng/connection_factory.dart';
import 'package:the_be_hero/sing_up/pagesOng/daoOng/ong_dao.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';

import '../../menu/menu.component.dart';
import 'modelsOng/ong.model.dart';

class SingUpPageOng extends StatefulWidget {
  const SingUpPageOng({Key? key}) : super(key: key);
  static const String SING_UP_ONG = '/ong';
  @override
  State<SingUpPageOng> createState() => _SingUpPageOng();
}

class _SingUpPageOng extends State<SingUpPageOng> {
  final _formKeySingupOng = GlobalKey<FormState>();
  final _nomeOngController = TextEditingController();
  final _emailOngController = TextEditingController();


  bool showPassword = false;

  @override
  void dispose() {
    _nomeOngController.dispose();
    _emailOngController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastre-se'),
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
                  key: _formKeySingupOng,
                  child: Column(children: [
                    ///NOME
                    TextFormField(
                      // validator: (value) => _validateForm(value),
                      controller: _nomeOngController,
                      keyboardType: TextInputType.name,
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

                    ///CNPJ PRECISA ARRUMAR A FORMATAÇÃO DO CNPJ

                    SizedBox(
                      height: 10,
                    ),

                    ///EMAIL
                    TextFormField(
                      //validator: (value) => _validateForm(value),
                      controller: _emailOngController,
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

              //
              //     ///DA PARA UTILIZAR O VIA CEP PARA PUXAR INFORMAÇÕES RUA, DEPOIS PRECISA AJUSTAR A FORMATAÇÃO PARA CEP
              //           TextFormField(
              //             //validator: (value) => _validateForm(value),
              //             controller: _cepOngController,
              //             keyboardType: TextInputType.number,
              //             decoration: InputDecoration(
              //                 labelText: "CEP",
              //                 labelStyle: TextStyle(
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 20,
              //                 )),
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //           ///VER SE DA PARA IMPORTAR OS DADOS DO CONFORME O CEP DIGITADO PARA FACILITAR A BUSCA E PREENCHER O CAMPO RUA
              //           TextFormField(
              //             //validator: (value) => _validateForm(value),
              //             controller: _ruaController,
              //             keyboardType: TextInputType.name,
              //             decoration: InputDecoration(
              //                 labelText: "Rua",
              //                 labelStyle: TextStyle(
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 20,
              //                 )),
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //           ///NUMERO DA ONG NECESSARIO QUE O USUARIO DIGITE  CAMPO OBRIGATORIO
              //           TextFormField(
              //             //validator: (value) => _validateForm(value),
              //             controller: _numOngController,
              //             keyboardType: TextInputType.number,
              //             decoration: InputDecoration(
              //                 labelText: "Numero",
              //                 labelStyle: TextStyle(
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 20,
              //                 )),
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //           ///CAMPO NAO OBRIGATORIO
              //           TextFormField(
              //             //validator: (value) => _validateForm(value),
              //             controller: _compOngController,
              //             keyboardType: TextInputType.text,
              //             decoration: InputDecoration(
              //                 labelText: "Complemento",
              //                 labelStyle: TextStyle(
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 20,
              //                 )),
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //           ///NUM TELEFONE FIXO, FALTA AJUSTAR PARA QUE O USUARIO COLOQUE SEU DDD, COM VAI FUNCIONAR SO NO BRASIL 55+ TEM QUE FICAR FIXO CAMPO OBRIGATORIO
              //           TextFormField(
              //             //validator: (value) => _validateForm(value),
              //             controller: _telFixoOngController,
              //             keyboardType: TextInputType.number,
              //             decoration: InputDecoration(
              //                 labelText: "Telefone Fixo",
              //                 labelStyle: TextStyle(
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 20,
              //                 )),
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //           /// NUM CELULAR + WHATSAPP, FALTA AJUSTAR PARA QUE O USUARIO COLOQUE SEU DDD, COM VAI FUNCIONAR SO NO BRASIL 55+ TEM QUE FICAR FIXO CAMPO OBRIGATORIO
              //           TextFormField(
              //             //validator: (value) => _validateForm(value),
              //             controller: _telCelOngController,
              //             keyboardType: TextInputType.number,
              //             decoration: InputDecoration(
              //                 labelText: "Telefone Celular/Whatsapp",
              //                 labelStyle: TextStyle(
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 20,
              //                 )),
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //
              //           /// CAMPO OBRIGATORIO
              //           TextFormField(
              //             //validator: (value) => _validateForm(value),
              //             controller: _descOngController,
              //             keyboardType: TextInputType.text,
              //             decoration: InputDecoration(
              //                 labelText: "Descrição",
              //                 labelStyle: TextStyle(
              //                   color: Colors.black38,
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 20,
              //                 )),
              //             style: TextStyle(
              //               fontSize: 20,
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //
              //           /// PAREI NA SENHA LINHA 141 DO PROJETO WEB
              //           TextFormField(
              //             validator: (value) {
              //               if (value!.length < 6) {
              //                 return "A senha deve ter pelo menos 6 caracteres";
              //               }
              //               return null;
              //             },
              //             controller: _passwordInputController,
              //             obscureText: (this.showPassword == true) ? false : true,
              //             keyboardType: TextInputType.text,
              //             decoration: InputDecoration(
              //               labelText: "Senha",
              //               labelStyle: TextStyle(
              //                 color: Colors.black38,
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 20,
              //               ),
              //               prefixIcon: Icon(
              //                 Icons.vpn_key_sharp,
              //                 color: Colors.black,
              //               ),
              //               focusedBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide(
              //                   color: Colors.black38,
              //                 ),
              //               ),
              //               enabledBorder: UnderlineInputBorder(
              //                 borderSide: BorderSide(
              //                   color: Colors.black38,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           (this.showPassword == false)
              //               ? TextFormField(
              //                   validator: (value) {
              //                     if (value != _passwordInputController.text) {
              //                       return "As senhas devem ser iguais";
              //                     }
              //                     return null;
              //                   },
              //                   controller: _confirmInputController,
              //                   obscureText: true,
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     fontWeight: FontWeight.w400,
              //                     fontSize: 20,
              //                   ),
              //                   decoration: InputDecoration(
              //                     labelText: "Confirme a Senha",
              //                     labelStyle: TextStyle(
              //                       color: Colors.black38,
              //                     ),
              //                     prefixIcon: Icon(
              //                       Icons.vpn_key_sharp,
              //                       color: Colors.white,
              //                     ),
              //                     focusedBorder: UnderlineInputBorder(
              //                       borderSide: BorderSide(
              //                         color: Colors.black38,
              //                       ),
              //                     ),
              //                     enabledBorder: UnderlineInputBorder(
              //                       borderSide: BorderSide(
              //                         color: Colors.black38,
              //                       ),
              //                     ),
              //                   ),
              //                 )
              //               : Container(),
              //           Row(
              //             children: [
              //               Checkbox(
              //                 value: this.showPassword,
              //                 onChanged: (bool? newValue) {
              //                   setState(() {
              //                     this.showPassword = newValue!;
              //                   });
              //                 },
              //                 activeColor: Colors.black,
              //               ),
              //               Text(
              //                 "Mostrar senha",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //     ),
              //               ),
              //            ],
              //          ),
              //        ],
              //     ),
              // ),

              /// PRECISA TROCA O NOME DE LOGIN PARA IMAGE
              /// PRECISA FAZER A LIGAÇÃO PARA SUBIR IMAGE E
              /// FALTA ALTERAR A IMAGEM COLOCAR UMA IMAGEM QUE FAÇA MAIS SENTIDO QUE O USUARIO PRECISA SUBIR ALGUMA IMAGEM
              /// CAMPO PRECISA SER OBRIGATORIO PARA QUE NAO EXISTA DIVERGENCIA PARA OS USUARIOS VISUALIZAREM A AIMAGEM
              /// DIMINUIR O BOTAO????? TALVEZ
              // Container(
              //   height: 60,
              //   alignment: Alignment.centerLeft,
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //       stops: [0.3, 1],
              //       colors: [
              //         Color(0xFFF58524),
              //         Color(0XFFF92B7F),
              //       ],
              //     ),
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(5),
              //     ),
              //   ),
              //   child: SizedBox.expand(
              //     child: TextButton(
              //       onPressed: () {},
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: <Widget>[
              //           Text(
              //             "Upload imagens da ONG",
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //               fontSize: 20,
              //             ),
              //             textAlign: TextAlign.left,
              //           ),
              //           Container(
              //             child: SizedBox(
              //               child: const Icon(Icons.add_a_photo),
              //             ),//Image.asset("assets/bone.png"),
              //               color: Colors.white, /// ficou feio mas da para levar ate achar a imagem boa  para acertar
              //               height: 28,
              //               width: 28,
              //             ),
              //         ],
              //       ),
              //       onPressed: () {
              //
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => HomePage(),
              //         ),
              //       );
              //       },
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 20,
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
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                       ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/bone.png"),
                            height: 28,
                            width: 28,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      _saveSignUp();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePage(),
                      //   ),
                      // );
                    },
                  ),
                ),
              ),

            ]
              )
        )
    ]
    )
        )

    );
  } void _saveSignUp() async {
   // Database? db = await ConnectionFactory.factory.database;
    //OngDAO dao = OngDAO(db!);
    Ongs ong = Ongs.nova(_nomeOngController.text,
        _emailOngController.text
    );

    // await dao.inserir(ong);
    // ConnectionFactory.factory.close();

     try{
       OngRepository repository = OngRepository();
       print(_nomeOngController);
       print(_emailOngController);
       await repository.inserir(ong);
       print(ong);

      _nomeOngController.clear();
      _emailOngController.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ONG salva com sucesso.')));
     }
     catch(exception){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('errorrrr')));
     }

  }
}
