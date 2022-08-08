import 'package:flutter/material.dart';
import 'package:the_be_hero/routes/routes.dart';

class Menu extends StatelessWidget{
  const Menu ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
          color: Colors.red,
          child: DrawerHeader(
              child: Column(
              children: const[
                //Text('The Be Hero'),
               Image(
                   image: AssetImage('assets/logo@3x.png'),
               )
              ],
          )
          ),
    ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.HOME);
            },
          ),
          ListTile(
            title: const Text('Casos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.listaCasoDeOng);
            },
          ),

          ListTile(
            title: const Text('cadastro de Casos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.inserirCasoOng);
            },
          ),
          ListTile(
            title: const Text('Voluntarios'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.HOME);
            },
          ),
          ListTile(
            title: const Text('Sobre nós'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.HOME);
            },
          )
        ],
      ),
    );
  }
}
