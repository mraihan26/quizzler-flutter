import 'package:flutter/material.dart';
import 'QuestionRepository.dart';

void main() => runApp(QuizPage());

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Quizzler(),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {

  QuestionRepository repo = QuestionRepository();
  int questionTracker = 0;
  List<Icon> icons = [];

  void keyPressed(bool key){
    if(questionTracker!=repo.getArr().length-1){
      if(repo.getArr()[questionTracker].getA() == key){
        icons.add(Icon(Icons.check,color: Colors.green,));
      }else{
        icons.add(Icon(Icons.close, color : Colors.red));
      }
      setState(() {
        questionTracker++;
      });
    }else{
      icons.clear();
      setState(() {
        questionTracker = 0;
      });
    }
  }

  Expanded buildButton(String tulis, bool jawab, Color warna){
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FlatButton(
          color: warna,
          textColor: Colors.black,
          onPressed: () {
            keyPressed(jawab);
          },
          child: Text(
            tulis,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Quizzler App',
          style: TextStyle(color: Colors.yellow[900]),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  repo.getArr()[questionTracker].getQ(),
                  style: TextStyle(fontSize: 25, color: Colors.yellow[900]),
                ),
              ),
            ),
            flex: 5,
          ),
          buildButton('True',true , Colors.green),
          buildButton('False',false , Colors.red),
          Row(
            children: icons,
          ),
        ],
      ),
    );
  }
}
