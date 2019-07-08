import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  _ListaPageState createState() => _ListaPageState();
}

List<int> _listaNumero = new List();
int _ultimoItem = 0;
bool _isLoading = false;

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _agregarItem();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregarItem();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista'),
        ),
        body: Stack(
          children: <Widget>[_crearLista(), _createLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPAgina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumero.length,
        itemBuilder: (BuildContext context, int index) {
          final img = _listaNumero[index];
          return FadeInImage(
            image: NetworkImage(
                'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2018/08/spider-man-vencer-thanos.jpg?resize=1080%2C600&quality=90&ssl=1' //'https://picsum.photos/500/300/?image=$_listaNumero[$index]'
                ),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPAgina() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumero.clear();
      _ultimoItem++;
      _agregarItem();
    });
    return Future.delayed(duration);
  }

  void _agregarItem() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumero.add(i);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(microseconds: 250));
    _agregarItem();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if (_isLoading)
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    else
      return Container();
  }
}
