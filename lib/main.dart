import 'package:flutter/material.dart';
import "package:flutter/services.dart" show rootBundle;


void main() => runApp(MaterialApp(
    home: Test(),
));

class Test extends StatefulWidget{
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String data = '';
  Future<String> getState() async{
  String responseText;
  responseText = await rootBundle.loadString('assets/random_numbers.txt');
  setState((){
    data = responseText;
  }
);
  return data;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Dados'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      body:
      Container(
        padding:
        EdgeInsets.fromLTRB(10.0, 40.0 , 30.0, 0.0),
        margin:
        EdgeInsets.all(20.0),
        child:
        StreamBuilder<String>(
        stream: Stream.fromFuture(getState()),
        builder: (context, snapshot){
        if(snapshot.hasData){
          return Column(
            children: <Widget>[
              Text(
             'VELOCIDADE: ' + snapshot.data! + 'm/s',
             style: TextStyle(color: Colors.grey)
             ,),]);
       } else if (!snapshot.hasData){
              return Center(
              child: Text(
                'Não há nenhum dado'),);
       } else  {
              return Center(child: CircularProgressIndicator(),
            );
            }
          },
      ),
    )
  );
  }
}
