import 'package:flutter/material.dart';
import 'package:quiz_world/modals/questions.dart';
import 'package:quiz_world/qna.dart';
import 'package:quiz_world/qna/funnytrickyqna.dart';

class FunnyTrickyQNA extends StatefulWidget {
  @override
  _FunnyTrickyQNAState createState() => _FunnyTrickyQNAState();
}

class _FunnyTrickyQNAState extends State<FunnyTrickyQNA> {
  
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<Questions> questions = getQuestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[400],
      appBar: AppBar(
        title: Text('Best 10 Funny Tricky Questions'),
        elevation: 0.0,
        backgroundColor: Colors.redAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: questions.map((question) => QuestionsAndAnswers(
                  question: question,
                  showAnswer: _counter >= 1 ? true : false, 
                )).toList(),
              ),
              SizedBox(height: 16.0,),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _incrementCounter,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.lightGreenAccent[700], Colors.lightGreenAccent[100]],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Show Answers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}