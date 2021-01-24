import 'package:flutter/material.dart';
import 'package:trabajotitulo/view/loginEstudiante.dart';
import 'package:trabajotitulo/view/loginProfesor.dart';


class homePage extends StatefulWidget{
  vistaPrincipal createState()=> vistaPrincipal();
}

class vistaPrincipal extends State<homePage>{

  Widget _buildCard(){
    return Card(
      elevation: 10.0,
      child: InkWell(
        onTap: (){
        final route = MaterialPageRoute(
            builder: (context) => loginEstudiante()
        );
        Navigator.push(context, route);
      },
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/Imagen1.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Nueva ficha clínica',style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }


  Widget _buildCardRevision(){
    return Card(
      elevation: 10.0,
      child: InkWell(
        onTap: (){
          final route = MaterialPageRoute(
              builder: (context) => loginProfesor()
          );
          Navigator.push(context, route);
        },
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/11.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Revisión ficha clínica',style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página principal"),
          centerTitle: true),

          body: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              _buildCard(),
              _buildCardRevision(),
            ],
          )
    );
  }
}