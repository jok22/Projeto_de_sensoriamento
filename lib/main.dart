import 'package:flutter/material.dart';
import "package:flutter/services.dart" show rootBundle;


void main() => runApp(MaterialApp(home: Test(),));

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
    if(responseText != data){
    data = responseText;
  }
  }
);
  return data;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: dead_code
      body: FutureBuilder<String>(future: getState(),
      builder: (context, snapshot){
      if(snapshot.hasData){
        return Center(
        child: Text(snapshot.data!),);
        } else if (!snapshot.hasData){
            return Center(
            child: Text('Não há nenhum dado'),);
            } else  {
                return Center(child: CircularProgressIndicator(),);};
        },
      ),
    );
  }
}
