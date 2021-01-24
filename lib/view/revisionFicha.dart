import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class revisionFicha extends StatefulWidget {
  @override
  vistaRevision createState() => vistaRevision();
}

class vistaRevision extends State<revisionFicha> {

  Future<void> openFile() async {
    String file = await FilePicker.getFilePath();
    print(file);
    final result = await OpenFile.open(file);
    setState(() {
      //_openResult = "type=${result.type}  message=${result.message}";
    });

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
        title: const Text('Búsqueda de fichas en el dispositivo'),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Text('open result: $_openResult\n'),
              FlatButton(
                child: FloatingActionButton(
                  child:(Icon(Icons.save)),
                  onPressed: openFile,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}




