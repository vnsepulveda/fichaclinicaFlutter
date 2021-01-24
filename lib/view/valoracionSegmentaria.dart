import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabajotitulo/view/valoracionSegmentariaCuerpo.dart';
import 'package:flutter/foundation.dart';



class valoracionSegmentaria extends StatefulWidget{
  vistaValoracionSegmentaria createState()=> vistaValoracionSegmentaria();
  final String nombreArchivo;
  final List valoracionPaciente;
  final List antecedentes;
  final String nomEst;
  final String rutEst;
  valoracionSegmentaria({Key key, @required this.nombreArchivo, this.valoracionPaciente, this.antecedentes, this.nomEst, this.rutEst}) : super(key: key);
}

class vistaValoracionSegmentaria extends State<valoracionSegmentaria> {
  String _perimetroCraneano='';
  List<String> _seleccionObservacion=['Normocráneo','Hidrocefalia','Microcefalia','Cefalohematoma','Bolsa Serosanguinea'];
  String _observacion='Normocráneo';
  String _fontanelasTamano='';
  List<String> _seleccionFontanela=['Deprimida','Normotensa','Abombada'];
  String _tipoFontanela='Deprimida';
  String _ojos='';
  String _implantacionAuricular='';
  String _pupilas='';
  String _secrecion='';
  String _fosasNasales='';
  String _fosasNasalesPermeables='';
  String _boca='';
  String _labios='';
  String _paladar='';
  String  _dientes='';
  String _movilidadCuello='';
  String _adenopatias='';



  @override
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

  Widget _buildPerimetroCraneo(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Perimetro craneano'),
      onChanged: (value) {
          _perimetroCraneano = value;
        },
    );
  }

  List <DropdownMenuItem<String>> getObservacion() {
    List<DropdownMenuItem<String>> listaObservacion = new List();

    _seleccionObservacion.forEach((observacion) {
      listaObservacion.add(DropdownMenuItem(
        child: Text(observacion),
        value: observacion,
      ));
    });
    return listaObservacion;
  }

  List <DropdownMenuItem<String>> getTipoFontanelas() {
    List<DropdownMenuItem<String>> listaFontanelas = new List();

    _seleccionFontanela.forEach((fontanelas) {
      listaFontanelas.add(DropdownMenuItem(
        child: Text(fontanelas),
        value: fontanelas,
      ));
    });
    return listaFontanelas;
  }

  Widget _dropDownObservacion() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Infeccion'),
      items: getObservacion(),
      value: _observacion,
      onChanged: (opt) {
        setState(() {
          _observacion = opt;
        });
      },
    );
  }

  Widget _dropDownTipoFontanelas() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Tipo fontanelas'),
      items: getTipoFontanelas(),
      value: _tipoFontanela,
      onChanged: (opt) {
        setState(() {
          _tipoFontanela = opt;
        });
      },
    );
  }
  Widget _buildTamanoFontanelas(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tamaño fontanelas'),
      onChanged: (value) {
            _fontanelasTamano = value;
          },
    );
  }

  Widget _buildOjos(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ojos'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _ojos = value;
      },
    );
  }

  Widget _buildPupilas(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Pupilas'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _pupilas = value;
      },
    );
  }

  Widget _buildSecrecion(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Secrecion'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _secrecion = value;
      },
    );
  }

  Widget _buildImplantacionAuricular(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Implantación auricular'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _implantacionAuricular = value;
      },
    );
  }

  Widget _buildFosasNasales(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fosas nasales'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _fosasNasales = value;
      },
    );
  }

  Widget _buildFosasNasalesPermeables(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fosas nasales permeables'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _fosasNasalesPermeables = value;
      },
    );
  }

  Widget _buildBoca(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Boca'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _boca = value;
      },
    );
  }

  Widget _buildLabios(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Labios'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _labios = value;
      },
    );
  }

  Widget _buildPaladar(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Paladar'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _paladar = value;
      },
    );
  }

  Widget _buildDientes(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dientes'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _dientes = value;
      },
    );
  }

  Widget _buildMovilidadCuello(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Movilidad'),
      onChanged: (value) {
        _movilidadCuello = value;
      },
    );
  }

  Widget _buildAdenopatias(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Adenopatías'),
      onChanged: (value) {
        _adenopatias = value;
      },
    );
  }


  List <Step> pasos;

  List<Step> _buildSteps() {
    pasos = [
      Step(
      title: const Text('Cabeza'),
      isActive: true,
      state: StepState.complete,
        content: Column(
          children: <Widget>[
            _buildPerimetroCraneo(),
            _dropDownObservacion(),
            _buildTamanoFontanelas(),
            _dropDownTipoFontanelas(),
            _buildOjos(),
            _buildPupilas(),
            _buildSecrecion(),
            _buildImplantacionAuricular(),
            _buildFosasNasales(),
            _buildFosasNasalesPermeables(),
            _buildBoca(),
            _buildLabios(),
            _buildPaladar(),
            _buildDientes(),
          ],
        ),
      ),
      Step(
        title: const Text('Cuello'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _buildMovilidadCuello(),
            _buildAdenopatias(),
          ],
        )
      )
    ];
  return pasos;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Valoracion Segmentaria')
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
                builder: (context) =>valoracionSegmentariaCuerpo(nombrearchivo: widget.nombreArchivo, valoracionSegmentariaCab: escribirArchivo(), antecedentes: widget.antecedentes, valoracionSeg: widget.valoracionPaciente, nomEst: widget.nomEst, rutEst: widget.rutEst),
            ));
          },
        ),
      );
  }


  escribirArchivo() {
    List valPaciente = ['Valoración segmentaria: \n',
      'Cabeza: \n'
      'Perímetro craneano' + '$_perimetroCraneano' + '\n',
      'Observación: ' + '$_observacion' + '\n',
      'Fontanelas: Tamano: ' + '$_fontanelasTamano' + ' centímetros \n',
      'Tipo fontanela: ' + '$_tipoFontanela' + '\n',
      'Ojos: ' + '$_ojos' + ' Pupilas: ' + '$_pupilas' + ' Secreción: ' + '$_secrecion' + '\n',
      'Implantación auricular: ' + '$_implantacionAuricular' + '\n',
      'Fosas nasales: ' + '$_fosasNasales' + '\n',
      'Fosas nasales permeables: ' + '$_fosasNasalesPermeables' + '\n',
      'Boca: ' + '$_boca' + ' Labios: ' + '$_labios' + ' Paladar: ' + '$_paladar' + ' Dientes: ' + '$_dientes' + '\n',
      'Cuello: \n'
      'Movilidad: ' + '$_movilidadCuello' + ' Adenopatías: ' + '$_adenopatias' + '\n'
    ];
    return valPaciente;
  }
}