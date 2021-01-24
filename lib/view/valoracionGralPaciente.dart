import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:trabajotitulo/view/valoracionSegmentaria.dart';

class valoracionGralPaciente extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return vistaValoracionGralPaciente();
  }
  final String nameArchivo;
  List antecedentes;
  final String nomEst;
  final String rutEst;
  valoracionGralPaciente({Key key, @required this.nameArchivo, this.antecedentes, this.nomEst, this.rutEst}) : super(key: key);
}

class vistaValoracionGralPaciente extends State<valoracionGralPaciente> {
  List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];  String frecuenciaCardiaca = '';
  String frecuenciaRespiratoria = '';
  String presionArterial = '';
  String presionArterialMedia = '';
  String saturacionOxigeno = '';
  String pesoDiario = '';
  String temperatura = '';
  String condicion = 'reactivo a estímulos';
  String tratamientoAsociado = '';
  List <String> _seleccionCondicion = [
    'reactivo a estímulos',
    'pasivo',
    'hipotónico',
    'hipertónico',
    'convulsionando'
  ];
  List <String> _seleccionPiel = [
    'palido',
    'moreno',
    'rubicunda',
    'cianotica',
    'icteria',
    'septica'
  ];
  List <String> seleccionHigiene = ['adecuada', 'no adecuada'];
  List <String> seleccionMovilidad = ['conservada', 'no conservada'];
  String movilidad = 'conservada';
  String higienePaciente = 'adecuada';
  String colorPiel = 'palido';
  String FLACC = '';
  String EVA='';
  String ENA='';
  String tratamientoDolor='';
  List <String> listadoInfeccion = ['si', 'no'];
  String seleccioninfeccion = 'si';
  String _sedacion = '';
  String _examenes = '';
  String _observaciones = '';
  String _ptjeEscalaCaidas = '';
  String _ptjeEscalaLesionPresion = '';
  String tratamientoAsociado2='';



  @override
  String value = '';
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

  List <DropdownMenuItem<String>> getCondicion() {
    List<DropdownMenuItem<String>> listaCondicion = new List();

    _seleccionCondicion.forEach((condicion) {
      listaCondicion.add(DropdownMenuItem(
        child: Text(condicion),
        value: condicion,
      ));
    });
    return listaCondicion;
  }

  Widget _dropDownCondicion() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Condición'),
      value: condicion,
      items: getCondicion(),
      onChanged: (opt) {
        setState(() {
          condicion = opt;
        });
      },
    );
  }

  List <DropdownMenuItem<String>> getColorPiel() {
    List<DropdownMenuItem<String>> listaPiel = new List();

    _seleccionPiel.forEach((piel) {
      listaPiel.add(DropdownMenuItem(
        child: Text(piel),
        value: piel,
      ));
    });
    return listaPiel;
  }

  Widget _dropDownColorPiel() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Color Piel'),
      items: getColorPiel(),
      value: colorPiel,
      onChanged: (opt) {
        setState(() {
          colorPiel = opt;
        });
      },
    );
  }

  Widget _buildTratamiento() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Tratamiento asociado"),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          tratamientoAsociado = value;
        }
    );
  }

  Widget _buildTratamientoAsociado2() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Tratamiento asociado"),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          tratamientoAsociado2 = value;
        }
    );
  }

  List <DropdownMenuItem<String>> getHigiene() {
    List<DropdownMenuItem<String>> listaHigienePaciente = new List();

    seleccionHigiene.forEach((higienePaciente) {
      listaHigienePaciente.add(DropdownMenuItem(
        child: Text(higienePaciente),
        value: higienePaciente,
      ));
    });
    return listaHigienePaciente;
  }

  Widget _dropDownHigienePaciente() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Higiene del paciente'),
      items: getHigiene(),
      value: higienePaciente,
      onChanged: (opt) {
        setState(() {
          higienePaciente = opt;
        });
      },
    );
  }

  List <DropdownMenuItem<String>> getMovilidad() {
    List<DropdownMenuItem<String>> listaMovilidad = new List();

    seleccionMovilidad.forEach((movilidadPaciente) {
      listaMovilidad.add(DropdownMenuItem(
        child: Text(movilidadPaciente),
        value: movilidadPaciente,
      ));
    });
    return listaMovilidad;
  }

  Widget _dropDownMovilidadPaciente() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'movilidad'),
      items: getMovilidad(),
      value: movilidad,
      onChanged: (opt) {
        setState(() {
          movilidad = opt;
        });
      },
    );
  }

  Widget _buildEvaluacionDolorFLACC() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Evaluación dolor FLACC"),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          FLACC = value;
        }
    );
  }

  Widget _buildEvaluacionDolorEVA() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Evaluación dolor EVA"),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          EVA = value;
        }
    );
  }

  Widget _buildEvaluacionDolorENA() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Evaluación dolor ENA"),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          ENA = value;
        }
    );
  }

  Widget _buildTratamientoDolor() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Tratamiento dolor"),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          tratamientoDolor = value;
        }
    );
  }

  Widget _buildSedacion() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Sedacion"),
        onChanged: (value) {
          _sedacion = value;
        }
    );
  }

  List <DropdownMenuItem<String>> getInfeccion() {
    List<DropdownMenuItem<String>> listaInfeccion = new List();

    listadoInfeccion.forEach((infeccion) {
      listaInfeccion.add(DropdownMenuItem(
        child: Text(infeccion),
        value: infeccion,
      ));
    });
    return listaInfeccion;
  }

  Widget _dropDownInfeccion() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Infeccion'),
      items: getInfeccion(),
      value: seleccioninfeccion,
      onChanged: (opt) {
        setState(() {
          seleccioninfeccion = opt;
        });
      },
    );
  }

  Widget _buildObservaciones() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "Sedacion"),
        onChanged: (value) {
          _observaciones = value;
        }
    );
  }
  Widget _buildFrecuenciaCardiaca() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Frecuencia Cardiaca'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          frecuenciaCardiaca = value;
        }
    );
  }

  Widget _buildFrecuenciaRespiratoria() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Frecuencia Respiratoria'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          frecuenciaRespiratoria = value;
        }
    );
  }

  Widget _buildPresionArterial(){
   return TextFormField(
        decoration: InputDecoration(labelText: 'Presion arterial'),
        keyboardType: TextInputType.number,
       onChanged:(value) {
          presionArterial = value;
        }
    );
  }

  Widget _buildPresionArterialMedia(){
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Presion arterial media'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          presionArterialMedia = value;
        }
    );
  }

  Widget _saturacionOxigeno(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Saturación de oxigeno'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          saturacionOxigeno = value;
        }
    );
  }

  Widget _buildpesoDiario(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Peso diario'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          pesoDiario = value;
        }
    );
  }

  Widget _buildTemperatura(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Temperatura'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          temperatura = value;
        }
    );
  }

  Widget _buildPuntuacionCaidas(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Puntaje escala de prevención de caídas'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          _ptjeEscalaCaidas = value;
        }
    );
  }

  Widget _buildPuntuacionLesionPresion(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Puntaje escale de prevención de Lesión por presión'),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          _ptjeEscalaLesionPresion = value;
        }
    );
  }

  Widget _buildExamenes(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Exámenes'),
        onChanged: (value) {
          _examenes = value;
        }
    );
  }


  List <Step> pasos;

  List<Step> _buildSteps() {
    pasos = [
      Step(
        title: const Text('Valoracion General'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _buildFrecuenciaCardiaca(),
            _buildFrecuenciaRespiratoria(),
            _buildPresionArterial(),
            _buildPresionArterialMedia(),
            _buildpesoDiario(),
            _buildTemperatura(),
            _saturacionOxigeno(),
          ],
        ),
      ),
      Step(
        title: const Text('Estado General'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _dropDownCondicion(),
            _buildTratamiento(),
            _dropDownColorPiel(),
            _dropDownHigienePaciente(),
            _dropDownMovilidadPaciente(),
            _buildEvaluacionDolorFLACC(),
            _buildEvaluacionDolorENA(),
            _buildEvaluacionDolorEVA(),
            _buildTratamientoDolor(),
            _buildSedacion(),
            _dropDownInfeccion(),
            _buildExamenes(),
            _buildTratamientoAsociado2(),
            _buildObservaciones(),
          ],
        ),
      ),
      Step(
        title: const Text('Puntaje escalas'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _buildPuntuacionCaidas(),
            _buildPuntuacionLesionPresion(),
          ],
        )
      )
    ];
    return pasos;
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Valoracion del paciente')
        ),
        body: Column(children:
            <Widget>[
              Expanded(
                child: Stepper(
                  steps: _buildSteps(),
                  currentStep: currenStep,
                  onStepContinue: next,
                  onStepCancel: cancel,
                  onStepTapped: (step) => goTo(step),
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child:(Icon(Icons.navigate_next)),
          onPressed: (){
            var valPac = escribirArchivo();
            Navigator.push(context,(MaterialPageRoute(
              builder: (context) =>valoracionSegmentaria(nombreArchivo: widget.nameArchivo, valoracionPaciente: valPac, antecedentes: widget.antecedentes, nomEst: widget.nomEst, rutEst: widget.rutEst),
            )));
          },
        ),
      );
    }


  escribirArchivo()  {
    List valPaciente = ['Valoración del paciente: \n',
      'Valoración General \n',
      'Control de signos vitales \n',
      'Frecuencia cardiaca: ' + '$frecuenciaCardiaca' + '\n',
      'Frecuencia respiratoria: ' + '$frecuenciaRespiratoria' + '\n',
      'Presión Arterial: ' + '$presionArterial' + '\n',
      'Presión Arterial media: ' + '$presionArterialMedia' + '\n',
      'Saturación Oxigeno: ' + '$saturacionOxigeno' + '\n',
      'Peso diario: ' + '$pesoDiario' + '\n',
      'Temperatura: ' + '$temperatura' + '\n',
      'Estado general \n',
      'Condición ' + '$condicion' + '\n',
      'Tratamiento asociado: ' + '$tratamientoAsociado' + '\n'
      'Color de piel: ' + '$colorPiel' + '\n',
      'Higiene del paciente: ' + '$higienePaciente' + '\n',
      'Movilidad: ' + '$movilidad' + '\n',
      'Evaluación del dolor \n',
      'FLACC :' + '$FLACC' + '\n',
      'EVA :' + '$EVA' + '\n',
      'ENA :' + '$ENA' + '\n',
      'Tratamiento dolor :' + '$tratamientoDolor' + '\n',
      'Sedación :' + '$_sedacion' + '\n',
      'Actualmente con infección: ' + '$seleccioninfeccion' + '\n',
      'Exámenes: ' + '$_examenes' + '\n',
      'Tratamiento asociado: ' + '$tratamientoAsociado2' + '\n',
      'Observaciones: ' + '$_observaciones' + '\n',
      'Puntaje escala de prevención de caidas: ' + '$_ptjeEscalaCaidas' + '\n',
      'Puntaje escala de prevención de lesión por presion: ' + '$_ptjeEscalaLesionPresion' + '\n',
  ];
    return valPaciente;
  }

}


