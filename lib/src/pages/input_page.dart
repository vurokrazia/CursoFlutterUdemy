import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  String _poder = "Volar";
  List<String> _poderes = ['Volar', 'Rayos x', 'Super aliento', 'Super Fuerza'];
  TextEditingController _editingDateTimeController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs G"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearInputEmail(),
          Divider(),
          _crearInputPassword(),
          Divider(),
          _crearInputFecha(context),
          Divider(),
          _crearInputDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: "Nombre",
          labelText: "Nombre",
          helperText: 'Solo nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
        ),
        onChanged: (valor) {
          _nombre = valor;
          setState(() {
            _crearPersona();
          });
        });
  }

  Widget _crearInputEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_email.length}'),
          hintText: "Email",
          labelText: "Email",
          helperText: 'Ingrese Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (valor) {
          _email = valor;
          setState(() {
            _crearPersona();
          });
        });
  }

  Widget _crearInputPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_password.length}'),
          hintText: "Password",
          labelText: "Password",
          helperText: 'Ingrese Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
        ),
        onChanged: (valor) {
          _password = valor;
          setState(() {
            _crearPersona();
          });
        });
  }

  Widget _crearInputFecha(BuildContext context) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _editingDateTimeController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Fecha de nacimiento",
          labelText: "Fecha",
          helperText: 'Nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_poder),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        locale: Locale('es'),
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1994),
        lastDate: new DateTime(2025));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _editingDateTimeController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDroppdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  _crearInputDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
            child: DropdownButton(
          value: _poder,
          items: getOpcionesDroppdown(),
          onChanged: (opt) {
            setState(() {
              _poder = opt;
            });
          },
        )),
      ],
    );
  }
}
