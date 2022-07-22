import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget{
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState()=> _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            //     showError(BuildContextcontext, Stringtitulo, Stringerro) async{
            // await showDialog(context: context,builder: (BuildContextcontext) {
            //   return
            // AlertDialog(title: Row(children: [Icon(Icons.error, color: Colors.red), Text("Erro"), ]),
            // content: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
            // children: [ Text("teste ertro arrumar"), Text("arrumar tela erro"),],),actions: [TextButton(child: Text("OK"),onPressed: () {Navigator.of(context).pop(); })]);});}

          ],
        ),
      )
    );
  }
}