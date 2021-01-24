import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabajotitulo/view/AutocuidadoRAC.dart';


class medidasInvasivas extends StatefulWidget{
  vistaValoracionMedidasInvasivas createState()=> vistaValoracionMedidasInvasivas();
  final String nombreArchivo;
  final List antecedentes;
  final List valseg;
  final List valSegCab;
  final List valSegInf;
  final List valSegCu;
  final String nomEst;
  final String rutEst;
  medidasInvasivas({Key key, @required this.nombreArchivo, this.antecedentes, this.valseg, this.valSegCab, this.valSegInf, this.valSegCu, this.rutEst, this.nomEst}) : super(key: key);
}

class vistaValoracionMedidasInvasivas extends State<medidasInvasivas> {
  String _TipoAccesoV ='';
  String _tamano='';
  String _ubicacion='';
  String _diasAccesoV='';
  String _usoAcceso='';
  List <String> _seleccionDispositivo=['SNG','SOG','SNY','Gatronomía','Yeyunostomía','Otro'];
  String _dispositivoAl='SNG';
  String _cateter='';
  String _tamanoDispEl='';
  String _dias='';
  String _valoracionDiaria='';

  int currenStep = 0;
  bool complete = false;

  next(){
    currenStep + 1 != pasos.length
        ? goTo(currenStep + 1)
        : setState(() => complete = true);
  }

  cancel(){
    if(currenStep > 0){
      goTo(currenStep - 1);
    }
  }

  goTo(int step){
    setState(() => currenStep = step);
  }

  Widget _builTipo(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tipo'),
      onChanged: (value) {
        _TipoAccesoV = value;
      },
    );
  }

  Widget _buildTamano(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tamaño'),
      onChanged: (value) {
        _tamano = value;
      },
    );
  }

  Widget _buildUbicacion(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ubicación'),
      onChanged: (value) {
        _ubicacion = value;
      },
    );
  }

  Widget _buildDias(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dias'),
      onChanged: (value) {
        _diasAccesoV = value;
      },
    );
  }

  Widget _buildUso(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Uso'),
      onChanged: (value) {
        _usoAcceso = value;
      },
    );
  }

  List <DropdownMenuItem<String>> getTipoDispositivo() {
    List<DropdownMenuItem<String>> listaDispositivo = new List();

    _seleccionDispositivo.forEach((dispositivoa) {
      listaDispositivo.add(DropdownMenuItem(
        child: Text(dispositivoa),
        value: dispositivoa,
      ));
    });
    return listaDispositivo;
  }

  Widget _dropDownDispositivoAlimentacion() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Dispositivo de Alimentación'),
      items: getTipoDispositivo(),
      value: _dispositivoAl,
      onChanged: (opt) {
        setState(() {
          _dispositivoAl = opt;
        });
      },
    );
  }

  Widget _buildCateter(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Catéter urinario'),
      onChanged: (value) {
        _cateter = value;
      },
    );
  }

  Widget _buildTamanoDispositivo(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tamaño'),
      onChanged: (value) {
        _tamanoDispEl = value;
      },
    );
  }

  Widget __buildDias(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dias'),
      onChanged: (value) {
        _dias = value;
      },
    );
  }

  Widget _buildValoracionDiaria(){
    return TextFormField(
      maxLines: null,
      onChanged: (value) {
        _valoracionDiaria = value;
      },
    );
  }

  List <Step> pasos;

  List<Step> _buildSteps() {
    pasos = [
      Step(
        title: const Text('Acceso Vascular'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _builTipo(),
            _buildTamano(),
            _buildUbicacion(),
            _buildDias(),
            _buildUso()
          ],
        ),
      ),
      Step(
          title: const Text('Dispositivo de alimentación'),
          isActive: true,
          state: StepState.complete,
          content: Column(
            children: <Widget>[
              _dropDownDispositivoAlimentacion()
            ],
          )
      ),
      Step(
          title: const Text('Dispositivo de eliminación'),
          isActive: true,
          state: StepState.complete,
          content: Column(
            children: <Widget>[
              _buildCateter(),
              _buildTamanoDispositivo(),
              _buildDias(),
            ],
          )
      ),
      Step(
          title: const Text('Valoración diaria clínica del paciente'),
          isActive: true,
          state: StepState.complete,
          content: Column(
            children: <Widget>[
              _buildValoracionDiaria(),
            ],
          )
      )
    ];
    return pasos;
  }

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Medidas invasivas'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stepper(
                steps: _buildSteps(),
                currentStep: currenStep,
                onStepContinue: next,
                onStepCancel: cancel,
                onStepTapped: (step) => goTo(step),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child:(Icon(Icons.navigate_next)),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>autoCuidadoRAC(narchivo: widget.nombreArchivo, antecedentes: widget.antecedentes, valSegCu: widget.valSegCu, valseg: widget.valseg, valSegCab:widget.valSegCab, valSegInf: widget.valSegInf, medidasInv: escribirArchivo(), nomEst: widget.nomEst, rutEst: widget.rutEst),
            ));
          },
        ),
    );
  }

  escribirArchivo() {
    List valPaciente = ['Medidas invasivas: \n',
      'Acceso vascular: \n',
      'Tipo: ' + '$_TipoAccesoV' + ' Tamaño: ' + '$_tamano' + ' Ubicación: ' + '$_ubicacion' + ' Días: ' + '$_dias' + ' Uso: ' + '$_usoAcceso',
      'Dispositivo de alimentación: \n',
      '$_dispositivoAl' + '\n',
      'Dispositivo de eliminación: \n',
      'Catéter urinario: ' + '$_cateter' + ' Tamaño: ' + '$_tamanoDispEl' + ' Días: ' + '$_dispositivoAl'+ '\n',
      'Valoración diaria clínica del paciente: ' + '$_valoracionDiaria' + '\n',
    ];
    return valPaciente;
  }
}
