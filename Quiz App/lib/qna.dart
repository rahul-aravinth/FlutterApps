import 'package:flutter/material.dart';
import 'package:quiz_world/modals/questions.dart';

class QuestionsAndAnswers extends StatelessWidget {

  final Questions question;

  final bool showAnswer;

  QuestionsAndAnswers({this.question,this.showAnswer});
  
  @override
  Widget build(BuildContext context) {

    if(showAnswer){
      return Card(
      elevation: 5.0,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                question.question,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0,),
              Row(
                children: <Widget>[
                  Text(
                    'Answer: ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Flexible(
                    child: Text(
                      question.answer,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
    else{
      return Card(
      elevation: 5.0,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                question.question,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0,),
              Row(
                children: <Widget>[
                  Text(
                    'Answer: ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    '?????',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
  }
}