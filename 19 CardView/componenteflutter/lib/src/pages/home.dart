import 'package:componenteflutter/src/providers/menu.dart';
import 'package:componenteflutter/src/utils/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageTmp extends StatelessWidget {
  final strutStyleBar = new StrutStyle(
    //Instancia Objectos globales para ser reutilizados.
    fontSize: 20,
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomePage',
          strutStyle: strutStyleBar,
        ),
        backgroundColor: Colors.green,
      ),
      body: _listCustom(),
    );
  }

  Widget _listCustom() {
// Los futures builders tiene 3 estados
// 1. Solicitud de informacion
// 2. Resolución de la solicitud o consulta
// 3. Error

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //Se dispara en cualquiera de los 3 estados.
        print('FutureBuilder : $snapshot');
        print(snapshot.data);
        return ListView(
          children: _itemsLista(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _itemsLista(List<dynamic>? data, BuildContext context) {
    List<Widget> optionMenu = new List<Widget>.empty(growable: true);

    data!.forEach((element) {
      final widgetTmp = ListTile(
        title: Text(element['texto']),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.more_vert),
        subtitle: Text('Este es un Subtitulo'),
        tileColor: Colors.green[50],
      );

      optionMenu.add(widgetTmp);
    });

    return optionMenu;
  }
}
