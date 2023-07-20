import 'package:flutter/material.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:the_be_hero/repositories/caso/CasoRepository.dart';


import '../caso.model.dart';

class ListaCasoOngIdPage extends StatefulWidget {
  static const String routeName = '/listaCasoOngId';
  @override
  State<StatefulWidget> createState() => _ListaCasoOngIdPageState();
}

class _ListaCasoOngIdPageState extends State<ListaCasoOngIdPage> {
  @override
  Widget build(BuildContext context) {
    Map caso = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    print(caso);
    return Scaffold(
      appBar: AppBar(
        title: Text(caso['nomedocaso']),
      ),
      drawer: Menu(),

      //body: _buildForm(context),
    );
  }
}
