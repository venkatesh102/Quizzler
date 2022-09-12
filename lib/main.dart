import 'package:flutter/material.dart' ;
import 'question.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createStaAppState();
}
class Question
{
  late String question;
  late bool answer;
  Question({required String q,required bool a}){
    question=q;
    answer=a;
  }
}
class Quizbrain
{
  int _questionnum=0;
  _Quizbrain() {
    List<Question> questionbank = [
      Question(q: 'You can lead a cow downstairs but not up stairs', a: true),
      Question(
          q: 'Approxmatly one quarter of human bones are in feet', a: false),
      Question(q: 'A slug\'s blood is green', a: true)
    ];
  }
    void check(){
      if(_questionnum<questionbank.length-1){
        _questionnum++;   String getquestion(){
        questionbank[_questionnum].question;
    }

  }

}
   Quizbrain quibrain
class _MyAppState extends State<MyApp> {
  var question = 0;
  @override
  List<Icon> scorekeeper = [
    Icon(Icons.check, color: Colors.green,),
    Icon(Icons.close, color: Colors.red)
  ];

  // Question q1=Question(q,a:true);


  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Padding(padding: EdgeInsets.all(10),
              child: Center(child: Container(
                  child: Text(questionbank[question].question))))),
          Row(
              children: [
                Expanded(child: Container(height: 80,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                    color: Colors.green,
                    child: FlatButton(onPressed: () {bool correct=questionbank[question].answer;if(true==correct){
                      setState(() {
                        scorekeeper.add(Icon(Icons.check, color: Colors.green));
                        question = (question + 1) % 3;
                      });}
                      else{
                        setState(() {
                          scorekeeper.add(Icon(Icons.close, color: Colors.red));
                          question=(question+1)%3;
                        });
                    }
                    }, child: Text('TRUE')))),
              ]),
          Row(
              children: [
                Expanded(child: Container(height: 80,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
                    color: Colors.redAccent,
                    child: FlatButton(onPressed: () {bool correct=questionbank[question].answer;if(false==correct) {
                      setState(() {
                        scorekeeper.add(Icon(Icons.close, color: Colors.red));
                        question = (question + 1) % 3;
                      });
                    }
                    else{
    setState(() {
    scorekeeper.add(Icon(Icons.check, color: Colors.green));
    question = (question + 1) % 3;
    });
                    }
                    }, child: Text('FALSE')))),
              ]
          ),
          Row(children: scorekeeper)
        ]),));
  }
}

