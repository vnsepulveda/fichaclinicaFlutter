import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabajotitulo/view/medidasInvasivas.dart';

class valoracionSegmentariaInferior extends StatefulWidget{
  vistaValoracionSegmentariaInferior createState()=> vistaValoracionSegmentariaInferior();
  final String nomar;
  final List antecedentes;
  final List valoracionSegCab;
  final List valoracionSeg;
  final List valsegCuerpo;
  final String nomEst;
  final String rutEst;
  valoracionSegmentariaInferior({Key key, @required this.nomar, this.antecedentes, this.valoracionSeg, this.valoracionSegCab,this.valsegCuerpo, this.nomEst, this.rutEst}) : super(key: key);
}

class vistaValoracionSegmentariaInferior extends State<valoracionSegmentariaInferior> {

  String _genero='Masculino';
  String _testes='';
  String _fimosis='';
  String _labiosMenores='';
  String _labiosMayores='';
  String _maduros='';
  String _inmaduros='';
  String _integridad='';
  String _higiene='';
  String _dermatitis='';
  String _diuresis='';
  String _observaciones='';
  String _tratamientoAsociadoGen='';
  String _movilidad='';
  String _pulsos='';
  String _integridadInferior ='';
  String _valoracionDiaria='';
  int currentStep=0;
  bool complete = false;


  next(){
    currentStep + 1 != pasos.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel(){
    if(currentStep > 0){
      goTo(currentStep - 1);
    }
  }

  goTo(int step){
    setState(() => currentStep = step);
  }



  Widget _buildTestes(){
    return TextFormField(
    decoration: InputDecoration(labelText: 'Testes en escroto'),
      onChanged: (value) {
          _testes = value;
        },
      );

  }

  Widget _buildFimosis(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fimosis'),
      onChanged: (value) {
        _fimosis = value;
      },
    );
  }

  Widget _buildLabiosMenores(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Labios Menores'),
      onChanged: (value) {
        _labiosMenores = value;
      },
    );
  }

  Widget _buildLabiosMayores(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Labios mayores'),
      onChanged: (value) {
        _labiosMayores = value;
      },
    );
  }

  Widget _buildMaduros(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Maduros'),
      onChanged: (value) {
        _maduros = value;
      },
    );
  }

  Widget _buildInmaduros(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Inmaduros'),
      onChanged: (value) {
        _inmaduros = value;
      },
    );
  }

  Widget _buildIntegridad(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Integridad'),
      onChanged: (value) {
        _integridad = value;
      },
    );
  }

  Widget _buildHigiene(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Higiene'),
      onChanged: (value) {
        _higiene = value;
      },
    );
  }

  Widget _buildDermatitis(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dermatitis'),
      onChanged: (value) {
        _dermatitis = value;
      },
    );
  }

  Widget _buildDiuresis(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Diuresis'),
      onChanged: (value) {
        _diuresis = value;
      },
    );
  }

  Widget _buildObsGen(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Observaciones'),
      onChanged: (value) {
        _observaciones = value;
      },
    );
  }

  Widget _buildTratamientoAsociadoGen(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tratamiento asociado'),
      onChanged: (value) {
        _tratamientoAsociadoGen = value;
      },
    );
  }

  Widget _buildMovilidad(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Movilidad'),
      onChanged: (value) {
        _movilidad = value;
      },
    );
  }

  Widget _buildPulsos(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Pulsos'),
      onChanged: (value) {
        _pulsos = value;
      },
    );
  }

  Widget _buildIntegridadInferior(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Integridad'),
      onChanged: (value) {
        _integridadInferior = value;
      },
    );
  }


  List <Step> pasos;

  List<Step> _buildSteps() {
    pasos=[
      Step(
        title: const Text('Valoracion Segmentaria Inferior'),
        isActive: false,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            RadioListTile(
              title: const Text('Masculino'),
              value: 'Masculino',
              groupValue: _genero,
              onChanged: (value){
                setState(() {
                  _genero = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Femenino'),
              value: 'Femenino',
              groupValue: _genero,
              onChanged: (value){
                setState(() {
                  _genero = value;
                });
              },
            ),
            _buildTestes(),
            _buildFimosis(),
            _buildLabiosMayores(),
            _buildLabiosMenores(),
            _buildMaduros(),
            _buildInmaduros(),
            _buildIntegridad(),
            _buildHigiene(),
            _buildDermatitis(),
            _buildDiuresis(),
            _buildObsGen(),
            _buildTratamientoAsociadoGen(),
          ],
        )
      ),
      Step(
        title: const Text('Movilidades inferiores'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _buildMovilidad(),
            _buildPulsos(),
            _buildIntegridadInferior(),
          ],
        )
      ),
    ];
    return pasos;
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Valoracion Segmentaria"),
            centerTitle: true),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stepper(
                steps: _buildSteps(),
                currentStep: currentStep,
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
              builder: (context) =>medidasInvasivas(nombreArchivo: widget.nomar, antecedentes: widget.antecedentes, valseg: widget.valoracionSeg, valSegCab: widget.valoracionSegCab, valSegCu: widget.valsegCuerpo, valSegInf: escribirArchivo(), nomEst: widget.nomEst, rutEst: widget.rutEst),
            ));
          },
        ),
      );
  }

  escribirArchivo() {
    List valPaciente = ['Genitales: \n',
      'Género: ' + '$_genero' + '\n',
      'Testes en escroto: ' + '$_testes' + '  Fimosis: ' + '$_fimosis' + '\n',
      'Labios menores: ' + '$_labiosMenores' + ' Labios mayores' + '$_labiosMayores' + '\n',
      'Maduros: ' + '$_maduros' + ' Inmaduros: ' + '$_inmaduros' + '\n',
      'Integridad: ' + '$_integridad' + ' Higiene: ' + '$_higiene' + ' Dermatitis: ' + '$_dermatitis' + '\n',
      'Diuresis: ' + '$_diuresis'+ '\n',
      'Observaciones: ' + '$_observaciones' + '\n',
      'Tratamiento asociado: ' + '$_tratamientoAsociadoGen' + '\n',
      'Extremidades inferiores: \n',
      'Movilidad: ' + '$_movilidad' + ' Pulsos: ' + '$_pulsos' + ' Integridad: ' + '$_integridadInferior' + '\n',
    ];
    return valPaciente;
  }
}