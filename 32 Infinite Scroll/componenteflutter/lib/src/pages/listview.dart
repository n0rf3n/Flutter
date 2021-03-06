import 'package:flutter/material.dart';

class listViewCustom extends StatefulWidget {
  @override
  _listViewCustomState createState() => _listViewCustomState();
}

class _listViewCustomState extends State<listViewCustom> {
  List<int> _listNumbers = List<int>.empty(growable: true);
  int _lastItem = 0;

  //Controlador de la lista para manejar el Scroll
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    //Es un metodo del ciclo de vida de la creacion de un StatefulWidget
    super.initState(); //Hace referencia a la clase state y la inicializa.
    _addFivePhoto(); //Inicializa el Arreglo.
    //Se agrergar un Listener para el scroll

    _scrollController.addListener(() {
      print('Scroll');
      //Valor o posicion actual en pixeles y maximo en pixeles.
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //Detecta que esta al final
        _addFivePhoto();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        backgroundColor: Colors.green,
      ),
      body: _createList(),
    );
  }

  _createList() {
    return ListView.builder(
      controller: _scrollController, //Asigna el controlador
      //Encargado de renderizar todos los elementos, las veces que sea necesario
      itemCount: _listNumbers.length, //cantidad de items.
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listNumbers[index];
        print('Toma : $imagen');

        return FadeInImage(
          placeholder: AssetImage('assets/placeholder.gif'),
          image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
        );
      }, //Forma de como se va a dibujar el elemento
    );
  }

  void _addFivePhoto() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }
    setState(() {}); //Redibujar la pantalla
  }
}
