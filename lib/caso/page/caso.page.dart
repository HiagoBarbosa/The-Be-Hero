import 'package:flutter/material.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:the_be_hero/repositories/caso/CasoRepository.dart';

import '../caso.model.dart';

class InserirCasoOng extends StatefulWidget {
  const InserirCasoOng({Key? key}) : super(key: key);

  static const String routeName = '/insereCasoDeOng';

  State<InserirCasoOng> createState() => _InserirCasoOngState();
}

class _InserirCasoOngState extends State<InserirCasoOng> {
  final _formKeyCaso = GlobalKey<FormState>();
  final _nomeCasoController = TextEditingController();
  final _recaCasoController = TextEditingController();
  final _especieCasoController = TextEditingController();
  final _dtaRecolhidoCadoController = TextEditingController();
  final _descricaoCasoController = TextEditingController();
  final _imageCasoController = TextEditingController();

  void dispose() {
    _nomeCasoController.dispose();
    _recaCasoController.dispose();
    _especieCasoController.dispose();
    _dtaRecolhidoCadoController.dispose();
    _descricaoCasoController.dispose();
    _imageCasoController.dispose();
    super.dispose();
  }

  void _salvar() async {

    Caso caso = Caso.novo(_nomeCasoController.text, _recaCasoController.text, _especieCasoController.text,
      _dtaRecolhidoCadoController.text,_descricaoCasoController.text, _imageCasoController.text);

try{
  CasoRepository repository = CasoRepository();
  await repository.inserir(caso);
  _nomeCasoController.clear();
  _recaCasoController.clear();
  _especieCasoController.clear();
  _dtaRecolhidoCadoController.clear();
  _descricaoCasoController.clear();
  _imageCasoController.clear();
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Caso salvo com sucesso.')));
}catch(exception){
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('errorrrrr')));
}

  }

  @override
  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKeyCaso,
          child: ListView(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              shrinkWrap: true,
              children: [
                Form(
                  child: Column(
                      children: [
                    TextFormField(
                      controller: _nomeCasoController,
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
                        controller: _recaCasoController,
                        validator: (value){
                          if(value!.isEmpty){
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

                    ])
                  ),
                Form(
                    child: Column(children: [
                      TextFormField(
                        controller: _especieCasoController,
                        validator: (value){
                          if(value!.isEmpty){
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

                    ])
                  ),
                Form(
                    child:Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: _dtaRecolhidoCadoController,
                        validator: (value){
                          if(value!.isEmpty){
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

                    ])
                  ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _descricaoCasoController,
                        validator: (value){
                          if(value!.isEmpty){
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
                    ])
                  ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _imageCasoController,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Campo nao pode ser vazio';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "inserir imagem ver como faz depois",
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
                    ])
                  ),
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

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inserir caso ong"),
      ),
      drawer: Menu(),
      body: _buildForm(context),
    );
  }
}
