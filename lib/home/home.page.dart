
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_be_hero/menu/menu.component.dart';
import 'package:the_be_hero/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listHome = ['e'];
  late CarouselSlider instance;

  @override
  void initSate(){
    super.initState();

    listHome.add('teste 1');
    listHome.add('teste 2');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: ()async {
            await Navigator.pushNamed(context, AppRoutes.login);
          }, icon: Icon(Icons.account_circle_sharp))
        ],
      ),
      drawer: const Menu(),
      body: Column(children: [
        const Text('Seja Bem-Vindo!'), //precisa ajusta o tamnho ainda e passar algumas imagens para teste
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
          ),
          items: listHome.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        )
      ],),
    );
  }
}