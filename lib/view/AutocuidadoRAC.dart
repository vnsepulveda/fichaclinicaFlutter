import 'package:flutter/material.dart';
import 'package:trabajotitulo/view/procesoEnfermero.dart';


class autoCuidadoRAC extends StatefulWidget {
  @override
  autoCuidadoRACVista createState() => autoCuidadoRACVista();
  final String narchivo;
  final List antecedentes;
  final List valseg;
  final List valSegCab;
  final List valSegInf;
  final List medidasInv;
  final List valSegCu;
  final String nomEst;
  final String rutEst;
  autoCuidadoRAC({Key key, @required this.narchivo, this.valseg, this.valSegCab, this.valSegInf, this.medidasInv, this.antecedentes, this.valSegCu, this.nomEst, this.rutEst}) : super(key: key);
}


class autoCuidadoRACVista extends State<autoCuidadoRAC> {

    String _mantenAire='compensado';
    String _mantenimientoAgua='compensado';
    String _mantAlimentos = 'compensado';
    String _eliminacionUrinaria='compensado';
    String _actividadydescanso='compensado';
    String _comSocial='compensado';
    String _prevencionPeligros='compensado';
    String _promocionfuncionamiento='compensado';
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



    List <Step> pasos;
    List<Step> _buildSteps() {
      pasos=[
        Step(
            title: const Text('Mantenimiento de un ingreso suficiente de aire.'),
            isActive: true,
            state: StepState.complete,
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Compensado'),
                  value: 'compensado',
                  groupValue: _mantenAire,
                  onChanged: (value){
                    setState(() {
                      _mantenAire = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Alterado'),
                  value: 'alterado',
                  groupValue: _mantenAire,
                  onChanged: (value){
                    setState(() {
                      _mantenAire = value;
                    });
                  },
                )
              ],
            )
        ),
        Step(
          title: const Text('Mantenimiento de una ingesta suficiente de agua.'),
          isActive: true,
          state: StepState.complete,
          content: Column(
            children: <Widget>[
              RadioListTile(
                title: const Text('Compensado'),
                value: 'compensado',
                groupValue: _mantenimientoAgua,
                onChanged: (value){
                  setState(() {
                    _mantenimientoAgua = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Alterado'),
                value: 'alterado',
                groupValue: _mantenimientoAgua,
                onChanged: (value){
                  setState(() {
                    _mantenimientoAgua = value;
                  });
                },
              )
            ],
          )
        ),
        Step(
            title: const Text('Mantenimiento de una ingesta suficiente de alimentos.'),
            isActive: true,
            state: StepState.complete,
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Compensado'),
                  value: 'compensado',
                  groupValue: _mantAlimentos,
                  onChanged: (value){
                    setState(() {
                      _mantAlimentos = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Alterado'),
                  value: 'alterado',
                  groupValue: _mantAlimentos,
                  onChanged: (value){
                    setState(() {
                      _mantAlimentos = value;
                    });
                  },
                )
              ],
            )
        ),
        Step(
            title: const Text('Cuidados asociados con procesos de eliminación urinaria e intestinal.'),
            isActive: true,
            state: StepState.complete,
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Compensado'),
                  value: 'compensado',
                  groupValue: _eliminacionUrinaria,
                  onChanged: (value){
                    setState(() {
                      _eliminacionUrinaria = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Alterado'),
                  value: 'alterado',
                  groupValue: _eliminacionUrinaria,
                  onChanged: (value){
                    setState(() {
                      _eliminacionUrinaria = value;
                    });
                  },
                )
              ],
            )
        ),
        Step(
            title: const Text('Equilibrio entre actividades y descanso.'),
            isActive: true,
            state: StepState.complete,
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Compensado'),
                  value: 'compensado',
                  groupValue: _actividadydescanso,
                  onChanged: (value){
                    setState(() {
                      _actividadydescanso = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Alterado'),
                  value: 'alterado',
                  groupValue: _actividadydescanso,
                  onChanged: (value){
                    setState(() {
                      _actividadydescanso = value;
                    });
                  },
                )
              ],
            )
        ),
        Step(
            title: const Text('Equilibrio entre soledad y la comunicación social.'),
            isActive: true,
            state: StepState.complete,
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Compensado'),
                  value: 'compensado',
                  groupValue: _comSocial,
                  onChanged: (value){
                    setState(() {
                      _comSocial = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Alterado'),
                  value: 'alterado',
                  groupValue: _comSocial,
                  onChanged: (value){
                    setState(() {
                      _comSocial = value;
                    });
                  },
                )
              ],
            )
        ),
        Step(
            title: const Text('Prevención de peligros para la vida, funcionamiento y bienestar humano'),
            isActive: true,
            state: StepState.complete,
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Compensado'),
                  value: 'compensado',
                  groupValue: _prevencionPeligros,
                  onChanged: (value){
                    setState(() {
                      _prevencionPeligros = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Alterado'),
                  value: 'alterado',
                  groupValue: _prevencionPeligros,
                  onChanged: (value){
                    setState(() {
                      _prevencionPeligros = value;
                    });
                  },
                )
              ],
            )
        ),
        Step(
            title: const Text('Promoción del funcionamiento humano y el desarrollo en grupos sociales'),
            isActive: true,
            state: StepState.complete,
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('Compensado'),
                  value: 'compensado',
                  groupValue: _promocionfuncionamiento,
                  onChanged: (value){
                    setState(() {
                      _promocionfuncionamiento = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Alterado'),
                  value: 'alterado',
                  groupValue: _promocionfuncionamiento,
                  onChanged: (value){
                    setState(() {
                      _promocionfuncionamiento = value;
                    });
                  },
                )
              ],
            )
        ),
      ];
      return pasos;
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text('Autocuidado RAC')),
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
              builder: (context) =>procesoEnfermero(nomarchivo: widget.narchivo, antecedentes: widget.antecedentes, valseg: widget.valseg, valSegCab: widget.valSegCab, valSegCu: widget.valSegCu, valSegInf: widget.valSegInf, medidasInv: widget.medidasInv ,RAC: escribirArchivo(), nomEst: widget.nomEst, rutEst: widget.rutEst),
            ));
          },
        ),
      );
  }

    escribirArchivo(){
      List valPaciente = ['Mantenimiento de un ingreso suficiente de aire: ' + '$_mantenAire' + '\n',
        'Mantenimiento de una ingesta suficiente de agua: ' + '$_mantenimientoAgua' + '\n',
        'Mantenimiento de una ingesta suficiente de alimentos: ' + '$_mantAlimentos' + '\n',
        'Provisión de cuidados asociados con procesos de eliminación urinaria e intestinal: ' + '$_eliminacionUrinaria' + '\n',
        'Equilibrio entre actividades y descanso: ' + '$_actividadydescanso' + '\n',
        'Equilibrio entre soledad y la comunicación social: ' + '$_comSocial' + '\n',
        'Prevención de peligros para la vida, funcionamiento y bienestar humano: ' + '$_prevencionPeligros' + '\n',
        'Promoción del funcionamiento humano y el desarrollo dentro de los grupos sociales de acuerdo con el potencial humano: ' + '$_promocionfuncionamiento' + '\n',
      ];
      return valPaciente;
    }
}
