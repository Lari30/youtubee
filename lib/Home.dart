import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show AppBar, BottomNavigationBar, BottomNavigationBarItem, BottomNavigationBarType, BuildContext, Colors, Container, EdgeInsets, Icon, IconButton, IconThemeData, Icons, Image, Scaffold, State, StatefulWidget, Widget, showSearch;
import 'package:youtubee/CustomSearchDelegate.dart';
import 'package:youtubee/telas/Biblioteca.dart';
import 'package:youtubee/telas/EmAlta.dart';
import 'package:youtubee/telas/Inicio.dart';
import 'package:youtubee/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";
  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search)
              onPressed: () async {
                String? res = await showSearch( context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res!;
                }
                );
                if (kDebugMode) {
                  print("resultado: digitado ${res!}"
                );
                }
              },

          ),
          /*
          IconButton(
              onPressed: () {
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                print("acao: conta");
              },
              icon: Icon(Icons.account_circle))
        ],*/
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                //backgroundColor: Colors.orange,
                icon: Icon(Icons.home),
                label: "Inicio"),
            BottomNavigationBarItem(
                //backgroundColor: Colors.red,
                icon: Icon(Icons.whatshot),
                label: "Em Alta"),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                icon: Icon(Icons.subscriptions),
                label: "Inscrições"),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: "Biblioteca"),
          ]),
    );
  }
}
