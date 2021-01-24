import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:trabajotitulo/view/valoracionSegmentariaInferior.dart';


class valoracionSegmentariaCuerpo extends StatefulWidget{
  vistaValoracionSegmentariaCuerpo createState()=> vistaValoracionSegmentariaCuerpo();
  final String nombrearchivo;
  final List antecedentes;
  final List valoracionSeg;
  final List valoracionSegmentariaCab;
  final String nomEst;
  final String rutEst;
  valoracionSegmentariaCuerpo({Key key, @required this.nombrearchivo, this.antecedentes, this.valoracionSeg, this.valoracionSegmentariaCab, this.nomEst, this.rutEst}) : super(key: key);
}

class vistaValoracionSegmentariaCuerpo extends State<valoracionSegmentariaCuerpo> {

  String _respiracion='';
  List <String> _seleccionFormaTorax=['Simétrica','Asimétrica'];
  String _formaTorax='Simétrica';
  String _ruidos='';
  String _secreciones='';
  String _retraccion='';
  String _oxigenoterapia='';
  String _fio2='';
  String _observacionesTorax='';
  String _tratamientoAsociadoTorax='';
  String _movilidadES='';
  String _pulsosES='';
  String _integridadES='';
  List <String> _seleccionObservacionAbdomen=['Globuloso','Plano','Asimétrico','Simétrico','Ostomías','Onfalocele','Gastrosquisis'];
  String _observacionAbdomen='Globuloso';
  List <String> _seleccionPalpacionAbdomen=['Blando','Depresible','Indoloro','Tenso','Doloroso'];
  String _palpacion='Blando';
  List <String> _seleccionCordonUmbilical=['Ausente','Gelatinoso','Momificado'];
  String _cordonUmbilical='Ausente';
  String _secrecionCordon='';
  String _tipoCordon='';
  String _ruidoHidroaereos='';
  String _tecnicaAlimentacion='';
  String _deposiciones='';
  List <String> _seleccionDeposiciones=['Bilioso','Mucoso','Alimenticio'];
  String _deposicionesS='Bilioso';
  List <String> _seleccionVomito=['Si','No'];
  String _vomito='Si';
  String _caractVomito='';
  String _observacionesAbdomen='';
  String _tratamientoAsociadoAbdomen='';
  List <String> _seleccionDorso=['Simetrica','Asimétrica'];
  String _observacionDorso='';
  String _integridadDorso='';



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


  Widget _buildRespiracion(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Respiración'),
      onChanged: (value) {
        _respiracion = value;
      },
    );
  }

  List <DropdownMenuItem<String>> getTipoFormaTorax() {
    List<DropdownMenuItem<String>> formaTorax = new List();

    _seleccionFormaTorax.forEach((forma) {
      formaTorax.add(DropdownMenuItem(
        child: Text(forma),
        value: forma,
      ));
    });
    return formaTorax;
  }

  Widget _dropDownTipoTorax() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Tipo fontanelas'),
      items: getTipoFormaTorax(),
      value: _formaTorax,
      onChanged: (opt) {
        setState(() {
          _formaTorax = opt;
        });
      },
    );
  }

  Widget _buildRuidos(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ruidos'),
      onChanged: (value) {
        _ruidos = value;
      },
    );
  }

  Widget _buildSecreciones(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ruidos'),
      onChanged: (value) {
        _secreciones = value;
      },
    );
  }

  Widget _buildRetraccion(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Retracción'),
      onChanged: (value) {
        _retraccion = value;
      },
    );
  }

  Widget _buildOxigenoterapia(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Oxigenoterapia'),
      onChanged: (value) {
        _oxigenoterapia = value;
      },
    );
  }

  Widget _buildFio2(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fio2'),
      onChanged: (value) {
        _fio2 = value;
      },
    );
  }

  Widget _buildObservacionesTorax(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Observaciones torax'),
      onChanged: (value) {
        _observacionesTorax = value;
      },
    );
  }

  Widget _buildtratamientoAsociado(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tratamiento Asociado'),
      onChanged: (value) {
        _tratamientoAsociadoTorax = value;
      },
    );
  }

  Widget _buildMovilidadES(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Movilidad'),
      onChanged: (value) {
        _movilidadES = value;
      },
    );
  }

  List <DropdownMenuItem<String>> getTipoObservacionAb() {
    List<DropdownMenuItem<String>> obsAbdomen = new List();

    _seleccionObservacionAbdomen.forEach((obs) {
      obsAbdomen.add(DropdownMenuItem(
        child: Text(obs),
        value: obs,
      ));
    });
    return obsAbdomen;
  }

  Widget _dropDownObservAb() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Observación'),
      items: getTipoObservacionAb(),
      value: _observacionAbdomen,
      onChanged: (opt) {
        setState(() {
          _observacionAbdomen = opt;
        });
      },
    );
  }

  List <DropdownMenuItem<String>> getTipoPalpacion() {
    List<DropdownMenuItem<String>> palpabd = new List();

    _seleccionPalpacionAbdomen.forEach((palp) {
      palpabd.add(DropdownMenuItem(
        child: Text(palp),
        value: palp,
      ));
    });
    return palpabd;
  }

  Widget _dropDownPalpacion() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Palpación'),
      items: getTipoPalpacion(),
      value: _palpacion,
      onChanged: (opt) {
        setState(() {
          _palpacion = opt;
        });
      },
    );
  }

  List <DropdownMenuItem<String>> getTipoCordon() {
    List<DropdownMenuItem<String>> cordonum = new List();

    _seleccionCordonUmbilical.forEach((cu) {
      cordonum.add(DropdownMenuItem(
        child: Text(cu),
        value: cu,
      ));
    });
    return cordonum;
  }

  Widget _dropDownCordonUmbilical() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Cordón umbilical'),
      items: getTipoCordon(),
      value: _cordonUmbilical,
      onChanged: (opt) {
        setState(() {
          _cordonUmbilical = opt;
        });
      },
    );
  }

  Widget _buildSecrecionCU(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Secreción cordón umbilical'),
      onChanged: (value) {
        _secrecionCordon = value;
      },
    );
  }

  Widget _buildTipo(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tipo cordón'),
      onChanged: (value) {
        _tipoCordon = value;
      },
    );
  }


  Widget _buildPulsosES(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Pulsos'),
      onChanged: (value) {
        _pulsosES = value;
      },
    );
  }

  Widget _buildIntegridadES(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Integridad'),
      onChanged: (value) {
        _integridadES = value;
      },
    );
  }

  Widget _buildRuidosHidroaereos(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Auscultación: Ruidos Hidroaéreos'),
      onChanged: (value) {
        _ruidoHidroaereos = value;
      },
    );
  }

  Widget _buildTecnicaAlimentacion(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tecnica Alimentacion'),
      onChanged: (value) {
        _integridadES = value;
      },
    );
  }

  Widget _buildDeposiciones(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Deposiciones'),
      onChanged: (value) {
        _deposiciones = value;
      },
    );
  }

  List <DropdownMenuItem<String>> getResiduoG() {
    List<DropdownMenuItem<String>> residuoG = new List();

    _seleccionDeposiciones.forEach((rg) {
      residuoG.add(DropdownMenuItem(
        child: Text(rg),
        value: rg,
      ));
    });
    return residuoG;
  }

  Widget _dropDownResiduoG() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Residuos gástricos'),
      items: getResiduoG(),
      value: _deposicionesS,
      onChanged: (opt) {
        setState(() {
          _deposicionesS = opt;
        });
      },
    );
  }

  List <DropdownMenuItem<String>> getVomitos() {
    List<DropdownMenuItem<String>> vomitos = new List();

    _seleccionVomito.forEach((vom) {
      vomitos.add(DropdownMenuItem(
        child: Text(vom),
        value: vom,
      ));
    });
    return vomitos;
  }

  Widget _dropDownVomitos() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Vómitos'),
      items: getVomitos(),
      value: _vomito,
      onChanged: (opt) {
        setState(() {
          _vomito = opt;
        });
      },
    );
  }

  Widget _buildObservacionesAb(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Observaciones'),
      onChanged: (value) {
        _observacionesAbdomen = value;
      },
    );
  }

  Widget _buildTratamientoAsociadoAb(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tratamiento asociado'),
      onChanged: (value) {
        _tratamientoAsociadoAbdomen = value;
      },
    );
  }

  List <DropdownMenuItem<String>> getobsDorso() {
    List<DropdownMenuItem<String>> obsDorso = new List();

    _seleccionDorso.forEach((forma) {
      obsDorso.add(DropdownMenuItem(
        child: Text(forma),
        value: forma,
      ));
    });
    return obsDorso;
  }

  Widget _dropDownTipoDorso() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Observacion'),
      items: getobsDorso(),
      onChanged: (opt) {
        setState(() {
          _observacionDorso = opt;
        });
      },
    );
  }

  Widget _buildIntegridadDorso(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Integridad'),
      onChanged: (value) {
        _integridadDorso = value;
      },
    );
  }


  List <Step> pasos;

  List<Step> _buildSteps() {
    pasos = [
      Step(
        title: const Text('Tórax'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            _buildRespiracion(),
            _dropDownTipoTorax(),
            _buildRuidos(),
            _buildSecreciones(),
            _buildRetraccion(),
            _buildOxigenoterapia(),
            _buildFio2(),
            _buildObservacionesTorax(),
            _buildtratamientoAsociado(),
          ],
        ),
      ),
      Step(
          title: const Text('Extremidades superiores'),
          isActive: true,
          state: StepState.editing,
          content: Column(
            children: <Widget>[
              _buildMovilidadES(),
              _buildPulsosES(),
              _buildIntegridadES(),
            ],
          )
      ),
      Step(
          title: const Text('Abdómen'),
          isActive: true,
          state: StepState.editing,
          content: Column(
            children: <Widget>[
              _dropDownObservAb(),
              _dropDownPalpacion(),
              _dropDownCordonUmbilical(),
              _buildSecrecionCU(),
              _buildTipo(),
              _buildTecnicaAlimentacion(),
              _buildDeposiciones(),
              _dropDownResiduoG(),
              _dropDownVomitos(),
              _buildObservacionesAb(),
              _buildTratamientoAsociadoAb()
            ],
          )
      ),
      Step(
          title: const Text('Dorso'),
          isActive: true,
          state: StepState.editing,
          content: Column(
            children: <Widget>[
              _dropDownTipoDorso(),
              _buildIntegridadDorso(),
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
              builder: (context) =>valoracionSegmentariaInferior(nomar: widget.nombrearchivo, antecedentes:widget.antecedentes, valoracionSegCab: widget.valoracionSegmentariaCab, valoracionSeg: widget.valoracionSeg,  valsegCuerpo: escribirArchivo(), nomEst: widget.nomEst, rutEst: widget.rutEst),
            ));
          },
        ),
      );
  }

  escribirArchivo() {
    List valPaciente = ['Tórax: \n',
      'Respiración: ' + '$_respiracion' + '\n',
      'Forma: ' + '$_formaTorax' + ' Ruidos: ' + '$_ruidos' + ' Secreciones: ' + '$_secreciones' + '\n',
      'Retracción: ' + '$_retraccion' +' \n',
      'Oxigenoterapia: ' + '$_oxigenoterapia' + ' Fio2: ' + '$_fio2',
      'Observaciones: ' + '$_observacionesTorax' + '\n'
      'Tratamiento asociado: ' + '$_tratamientoAsociadoTorax' + '\n',
      'Extremidades superiores: \n'
      'Movilidad: ' + '$_movilidadES' + ' Pulsos: ' + '$_pulsosES' + ' Integridad: ' + '$_integridadES'+ '\n',
      'Abdomen: \n',
      'Observacion: ' + '$_observacionesAbdomen' + '\n',
      'Palpación: ' + '$_palpacion' + '\n',
      'Cordón umbilical: ' + '$_cordonUmbilical' + ' Secreción: ' + '$_secrecionCordon' + ' Tipo: ' + '$_tipoCordon',
      'Auscultación: ' + '$_ruidoHidroaereos' + '\n',
      'Técnica de alimentación: ' + '$_tecnicaAlimentacion' + '\n',
      'Deposiciones: ' + '$_deposiciones' + ' Residuo gástrico: ' + '$_deposicionesS' + '\n',
      'Vómitos: ' + '$_vomito' + ' Características: ' + '$_caractVomito' + '\n',
      'Observaciones: ' + '$_observacionesAbdomen' + '\n',
      'Tratamiento asociado: ' + '$_tratamientoAsociadoAbdomen' + '\n',
      'Dorso \n',
      'Observación: ' + '$_observacionesAbdomen' + '\n',
      'Integridad: ' + '$_integridadDorso' + '\n',
    ];
    return valPaciente;
  }
}

