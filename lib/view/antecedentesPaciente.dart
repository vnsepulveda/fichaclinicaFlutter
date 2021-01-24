import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabajotitulo/view/valoracionGralPaciente.dart';
import 'package:intl/intl.dart';



class antecedentesPaciente extends StatefulWidget{
  vistaAntecedentes createState()=> vistaAntecedentes();
  final String nombreEst;
  final String rutEst;
  antecedentesPaciente({Key key, @required this.nombreEst, this.rutEst}) : super(key: key);

}

class vistaAntecedentes extends State<antecedentesPaciente> {
  String _edadPaciente;
  String _diagnostico;
  String _diasHospitalizacion;
  String _edadMadre;
  String _edadPadre;
  String _morbilidadMaterna;
  List <String> _seleccionEmbarazoControlado = ['Si', 'No'];
  String _embarazoControlado='Si';
  String _fechaParto;
  String _pesoNacimiento;
  String _PC;
  String _semanasGestacion;
  List <String> _seleccionTipoParto = ['Cesárea', 'Eutocico'];
  String _tipoParto='Cesárea';
  String _RPM;
  String _medicamentos='';
  List <String> _seleccionapgar = ['1', '5', '10'];
  String _apgar='1';
  String _liquidoAmniotico;
  String diagnosticoOficial;
  String _vitK;
  String _BCG;
  String _PKUTSH;
  String _HepB;
  String _EOT;
  String _GrupoRhRN;
  String _talla;
  String _GrupoRhM;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _BuildEdadField() {
    return TextFormField(
        decoration: new InputDecoration(labelText: "Ingresar edad paciente"),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          _edadPaciente = value;
        }
    );
  }

  Widget _buildSemanasGestacion() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Semanas de Gestación'),
      onSaved: (value) {
        _semanasGestacion = value;
      },
    );
  }

  Widget _buildLiquidoAmniotico() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Líquido Amniotico: '),
      onSaved: (value) {
        _liquidoAmniotico = value;
      },
    );
  }

  Widget _BuildDiagnosticoField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Diagnostico'),
      onSaved: (value) {
        _diagnostico = value;
      },
    );
  }

  Widget _BuildDiasHospitalizacionField() {
    return TextFormField(
        decoration: new InputDecoration(labelText: "Dias de hospitalización"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _diasHospitalizacion = value;
        }
    );
  }

  Widget _buildEdadPadre() {
    return TextFormField(
        decoration: new InputDecoration(labelText: "Ingresar edad del padre"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _edadPadre = value;
        }
    );
  }

  Widget _buildEdadMadre() {
    return TextFormField(
        decoration: new InputDecoration(labelText: "Ingresar edad de la madre"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _edadMadre = value;
        }
    );
  }

  Widget _buildMorbilidadMaterna() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Morbilidad Materna'),
      onSaved: (value) {
        _morbilidadMaterna = value;
      },
    );
  }

  Widget _buildTalla() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Talla'),
      onSaved: (value) {
        _talla = value;
      },
    );
  }

  List <DropdownMenuItem<String>> getEmbarazoControlado() {
    List<DropdownMenuItem<String>> listaEmbarazo = new List();

    _seleccionEmbarazoControlado.forEach((embarazoControlado) {
      listaEmbarazo.add(DropdownMenuItem(
        child: Text(embarazoControlado),
        value: embarazoControlado,
      ));
    });
    return listaEmbarazo;
  }

  Widget _dropDownEmbarazoControlado() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Embarazo controlado'),
      items: getEmbarazoControlado(),
      value: _embarazoControlado,
      onChanged: (opt) {
        setState(() {
          _embarazoControlado = opt;
        });
      },
    );
  }


  Widget _buildFechaParto() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fecha Ingreso'),
      onSaved: (value) {
        _fechaParto = value;
      },
    );
  }


  Widget _buildPesoNacimiento() {
    return TextFormField(
        decoration: new InputDecoration(labelText: "Peso de nacimiento"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _pesoNacimiento = value;
        }
    );
  }

  Widget _buildPC() {
    return TextFormField(
        decoration: new InputDecoration(labelText: "PC"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _PC = value;
        }
    );
  }

  Widget _BuildSemanasGestacion() {
    return TextFormField(
        decoration: new InputDecoration(
            labelText: "semanas de gestación"),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          _semanasGestacion = value;
        }
    );
  }

  List <DropdownMenuItem<String>> getTipoEmbarazo() {
    List<DropdownMenuItem<String>> tipoEmbarazo = new List();

    _seleccionTipoParto.forEach((tipoparto) {
      tipoEmbarazo.add(DropdownMenuItem(
        child: Text(tipoparto),
        value: tipoparto,
      ));
    });
    return tipoEmbarazo;
  }

  Widget _dropDownTipoParto() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Tipo de parto'),
      items: getTipoEmbarazo(),
      value: _tipoParto,
      onChanged: (opt) {
        setState(() {
          _tipoParto = opt;
        });
      },
    );
  }


  Widget _buildRPM() {
    return TextFormField(
        decoration: new InputDecoration(labelText: "RPM"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _RPM = value;
        }
    );
  }

  Widget _buildMedicamentos() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Medicamentos'),
      onSaved: (value) {
        _medicamentos = value;
      },
    );
  }


  List <DropdownMenuItem<String>> getApgar() {
    List<DropdownMenuItem<String>> listapgar = new List();

    _seleccionapgar.forEach((Apgar) {
      listapgar.add(DropdownMenuItem(
        child: Text(Apgar),
        value: Apgar,
      ));
    });
    return listapgar;
  }

  Widget _dropDownApgar() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Apgar'),
      items: getApgar(),
      value: _apgar,
      onChanged: (opt) {
        setState(() {
          _apgar = opt;
        });
      },
    );
  }

  Widget _buildVitK() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Vit-K'),
      onSaved: (value) {
        _vitK = value;
      },
    );
  }

  Widget _buildBCG() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'BCG'),
      onSaved: (value) {
        _BCG = value;
      },
    );
  }

  Widget _buildPKU() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'PKU-TSH'),
      onSaved: (value) {
        _PKUTSH = value;
      },
    );
  }

  Widget _buildHepB() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Hep B'),
      onSaved: (value) {
        _HepB = value;
      },
    );
  }

  Widget _buildEOT() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'EOT'),
      onSaved: (value) {
        _EOT = value;
      },
    );
  }

  Widget _buildrhRN() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Grupo Rh recién nacido:'),
      onSaved: (value) {
        _GrupoRhRN = value;
      },
    );
  }

  Widget _buildrhM() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Grupo Rh de la madre:'),
      onSaved: (value) {
        _GrupoRhM = value;
      },
    );
  }

  String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Antecedentes"),
            centerTitle: true),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _BuildEdadField(),
                  _BuildDiagnosticoField(),
                  _BuildDiasHospitalizacionField(),
                  _buildEdadPadre(),
                  _buildEdadMadre(),
                  _buildMorbilidadMaterna(),
                  _dropDownEmbarazoControlado(),
                  _buildFechaParto(),
                  _buildPesoNacimiento(),
                  _buildTalla(),
                  _buildPC(),
                  _BuildSemanasGestacion(),
                  _dropDownTipoParto(),
                  _buildLiquidoAmniotico(),
                  _buildRPM(),
                  _buildMedicamentos(),
                   _dropDownApgar(),
                  _buildVitK(),
                  _buildBCG(),
                  _buildPKU(),
                  _buildHepB(),
                  _buildEOT(),
                  _buildrhRN(),
                  _buildrhM(),
                  SizedBox(),
                  RaisedButton(
                    child: Text('Guardar',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () {

                      _formKey.currentState.save();

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>valoracionGralPaciente(nameArchivo: nombreArchivo(), antecedentes: escribirDatos(), nomEst: widget.nombreEst, rutEst: widget.rutEst),
                      ));
                    },
                  )
                ],
              ),
            ),
          ),
          );
      }

  nombreArchivo(){
    var now = new DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – mm').format(now);
    return formattedDate;
  }

  escribirDatos(){
    List variables = ['Antecedentes del paciente: \n'
      'Edad del paciente:' + '$_edadPaciente' + '\n',
      'Diagnóstico de ingreso del paciente: ' + '$_diagnostico' + '\n',
      'Días de hospitalización: ' + '$_diasHospitalizacion' + '\n',
      'Edad de la madre: ' + '$_edadMadre' + '\n',
      'Edad del padre: ' + '$_edadPadre' + '\n',
      'Morbilidad materna: ' + '$_morbilidadMaterna' + '\n',
      'Embarazo controlado: ' + '$_embarazoControlado' + '\n',
      'Fecha hora y parto: ' + '$_fechaParto' + '\n',
      'Peso nacimiento: ' + '$_pesoNacimiento' + '\n',
      'Talla: ' + '$_talla' + '\n',
      'PC: ' + '$_PC' + '\n',
      'Semana de gestación: ' + '$_semanasGestacion' + '\n',
      'Tipo de parto: ' + '$_tipoParto' + '\n',
      'Liquido amniótico: ' + '$_liquidoAmniotico' + '\n',
      'Medicamentos: ' + '$_medicamentos' + '\n',
      'Apgar: ' + '$_apgar' + '\n',
      'VIT-K: ' + '$_vitK' + '\n',
      'BCG: ' + '$_BCG' + '\n',
      'PKU-TSH: ' + '$_PKUTSH' + '\n',
      'Hep B: ' + '$_HepB' + '\n',
      'EOT: ' + '$_EOT' + '\n',
      'Grupo Rh recién nacido: ' + '$_GrupoRhRN' + '\n',
      'Grupo Rh de la madre: ' + '$_GrupoRhM' + '\n',
];
    return variables;
    }
  }



