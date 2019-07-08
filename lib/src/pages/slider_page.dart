import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

double _valor_slider = 50.0;
bool _block = false;

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider")),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.purple,
      label: 'Tamaño de la imagen',
      divisions: 10,
      onChanged: _block
          ? null
          : (valor) {
              setState(() {
                _valor_slider = valor;
              });
            },
      value: _valor_slider,
      min: 1.0,
      max: 400.0,
    );
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            //'https://external-preview.redd.it/iChoDRMtwwcCbIXJ85Jgop7CaTwoURJ-b1C0BakmupE.png?auto=webp&s=904c04f3c9a6d0a519f131f8fbf349530a58920c'
            "https://is5-ssl.mzstatic.com/image/thumb/Video118/v4/3a/da/d9/3adad999-6ed0-de80-6b7e-8fccca15f42e/source/560x315mv.jpg"),
        width: _valor_slider,
        fit: BoxFit.contain);
  }

  Widget _crearCheckBox() {
    /* return Checkbox(
      value: _block,
      onChanged: (valor) {
        setState(() {
          _block = valor;
        });
      },
    ); */
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _block,
      onChanged: (valor) {
        setState(() {
          _block = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _block,
      onChanged: (valor) {
        setState(() {
          _block = valor;
        });
      },
    );
  }
}
