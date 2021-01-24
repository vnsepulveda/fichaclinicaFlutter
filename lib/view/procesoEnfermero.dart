import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trabajotitulo/view/homePage.dart';

class procesoEnfermero extends StatefulWidget{
  vistaProcesoEnfermero createState()=> vistaProcesoEnfermero();
  final String nomarchivo;
  final List antecedentes;
  final List valseg;
  final List valSegCab;
  final List valSegCu;
  final List valSegInf;
  final List medidasInv;
  final List RAC;
  final String nomEst;
  final String rutEst;
  procesoEnfermero({Key key, @required this.nomarchivo, this.antecedentes, this.valseg, this.valSegCab, this.valSegCu, this.valSegInf, this.medidasInv, this.RAC, this.rutEst, this.nomEst}) : super(key: key);
}

class vistaProcesoEnfermero extends State<procesoEnfermero>{

  String _diagnostico='';
  String _objetivoEnfermeria='';
  String _intervenciones='';
  String _evaluacionProceso='';

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

  Widget _buildDiagnostico(){
    return TextFormField(
      maxLines: null,
      onChanged: (value) {
        _diagnostico = value;
      },
    );
  }

  Widget _buildObjetivo(){
      return TextFormField(
        maxLines: null,
        onChanged: (value) {
          _objetivoEnfermeria = value;
        },
      );
    }

  Widget _buildIntervenciones(){
    return TextFormField(
      maxLines: null,
      onChanged: (value) {
        _intervenciones = value;
      },
    );
  }

  Widget _buildEvaluacion(){
    return TextFormField(
      maxLines: null,
      onChanged: (value) {
        _evaluacionProceso = value;
      },
    );
  }


  List <Step> pasos;

  List<Step> _buildSteps() {
    pasos = [
      Step(
        title: const Text('Diágnostico'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _buildDiagnostico()
          ],
        ),
      ),
      Step(
          title: const Text('Objetivo de enfermería'),
          isActive: true,
          state: StepState.complete,
          content: Column(
            children: <Widget>[
              _buildObjetivo()
            ],
          )
      ),
      Step(
          title: const Text('Intervenciones y actividades de enfermería'),
          isActive: true,
          state: StepState.complete,
          content: Column(
            children: <Widget>[
              _buildIntervenciones()
            ],
          )
      ),
      Step(
          title: const Text('Evaluación del proceso de enfermero'),
          isActive: true,
          state: StepState.complete,
          content: Column(
            children: <Widget>[
              _buildEvaluacion()
            ],
          )
      )
    ];
    return pasos;
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Proceso enfermero para los problemas del paciente'),
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
        backgroundColor: Colors.green,
        child:(Icon(Icons.save, color: Colors.white,)
        ),
        onPressed: (){
          escribirDatosEnArchivo();
          final route = MaterialPageRoute(
              builder: (context) => homePage()
          );
          Navigator.push(context, route);
        },
      ),
    );
  }

  escribirArchivo() {
    List valPaciente = [
      'Formule proceso enfermero atingente para los problemas del paciente: \n',
      'Diagnóstico: ' + '$_diagnostico' + '\n',
      'Objetivo de enfermería: ' + '$_objetivoEnfermeria' + '\n',
      'Intervenciones y actividades de enfermería: ' + '$_intervenciones' +
          '\n',
      'Evaluación del poceso enfermero: ' + '$_evaluacionProceso' + '\n',
    ];
    return valPaciente;
  }

  escribirDatosEnArchivo() async {
    List antecedentes = widget.antecedentes;
    List valoracionSegmentaria = widget.valseg;
    List valoracionCab = widget.valSegCab;
    List valCuerpo = widget.valSegCu;
    List valInf = widget.valSegInf;
    List medidasInv = widget.medidasInv;
    List RAC = widget.RAC;
    List procesoEnf = escribirArchivo();

    List datosParaArchivo = antecedentes + valoracionSegmentaria +
        valoracionCab + valCuerpo + valInf + medidasInv + RAC + procesoEnf;
    for (int i = 0; i < datosParaArchivo.length; i++) {
      await (await getLocalPath()).writeAsStringSync(
          "${datosParaArchivo[i]}", mode: FileMode.append);
    }
  }

  Future<File> getLocalPath() async {
    String fechaCreacion = widget.nomarchivo;
    String tempPath = '/sdcard/';
    return new File('$tempPath'+'$fechaCreacion'+'.txt');
  }
}