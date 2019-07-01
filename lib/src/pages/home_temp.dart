import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', "Dos", "Tres", "Cuatro", "Cinco"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(children: _crearItemCorto()),
    );
  }

  /* List<Widget> _crearItem(){
    List<Widget> lista = new List<Widget>();
    
    for (var item in opciones) {
      lista..add(
        ListTile(title: Text (item))
      )
      ..add(Divider());
    }
    return lista;
  } */
  List<Widget> _crearItemCorto() {
    var widgets = opciones.map((s) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(s),
            subtitle: Text("Cualquier cosa"),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(
            color: Color.fromARGB(15, 15, 15, 20),
          )
        ],
      );
    }).toList();
    return widgets;
  }
}
