import 'package:flutter/material.dart';
import 'package:trabajotitulo/view/antecedentesPaciente.dart';


class loginEstudiante extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return vistaLoginEstudiante();
  }
}

class vistaLoginEstudiante extends State<loginEstudiante> {
  final _formKey = GlobalKey<FormState>();
  String _rut;
  String _nombre;

  Widget _buildNombre(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Nombre'),
        validator: (value){
          if(value.isEmpty){
            return "Ingresar Nombre";
          }
        },
        onSaved: (value) {
          _nombre = value;
        }
    );
  }

  Widget _buildRUT(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'RUT'),
        validator: (value){
          if(value.isEmpty){
            return "Ingresar RUT";
          }
        },
        onSaved: (value) {
          _rut = value;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 10.0),
                  Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20.0),
                  _buildNombre(),
                  _buildRUT(),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text("INGRESAR"),
                    onPressed: () async {
                      if(!_formKey.currentState.validate()){
                        return;
                      }
                      final form = _formKey.currentState;
                      form.save();
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>antecedentesPaciente(),
                  ));
                  },
                )
                ])
            )
        )
      )
    );
  }

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>antecedentesPaciente(nombreEst: _nombre, rutEst: _rut),
                  ));
                })
          ],
        );
      },
      context: context,
    );
  }
}
