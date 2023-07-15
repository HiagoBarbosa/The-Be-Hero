import 'package:flutter/material.dart';
import 'package:the_be_hero/menu/menu.component.dart';

import '../../../routes/routes.dart';

class DesculpasTemporariaVoluntario extends StatefulWidget{
  const DesculpasTemporariaVoluntario ({Key? key}) : super(key: key);
  static const String routeName = '/DesculpasTemporariaVoluntario';

  @override
  State <DesculpasTemporariaVoluntario>createState()=> _DesculpasTemporariaVoluntarioState();
}

class _DesculpasTemporariaVoluntarioState extends State<DesculpasTemporariaVoluntario> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.login);
                },
                icon: const Icon(Icons.account_circle_sharp))
          ],
        ),
        drawer: const Menu(),
        body: Container(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            color: Colors.white,
            child: ListView(children: <Widget>[
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/logo@3x.png')),
              SizedBox(
                height: 40,
              ),
              Form(child:
              const Text('Agradecemos seu interesse em fazer parte do The Be Hero, assim que for possivel logar no App nós enviaremos um email',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(
                height: 50,
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
                          "Cadastre seu Voluntariado",
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
                    onPressed: ()async {
                      await Navigator.pushNamed(context, AppRoutes.inserirservicoVoluntarioEDoacao);
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),
            ])));
  }
}