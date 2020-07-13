import 'package:flutter/material.dart';
import 'package:quiz_world/pages/funnytrickyqna.dart';
import 'package:quiz_world/pages/trickyqna.dart';
import 'package:quiz_world/pages/mindtrickqna.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        title: Text('Welcome to Quiz world'),
        elevation: 0.0,
        backgroundColor: Colors.redAccent[700],
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(15.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      15.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/tricky.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(color: Colors.redAccent[700],width: 3,),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey[200],
                    child: Text(
                      'Tricky Questions',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent[400],
                        fontFamily: 'VT323',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => TrickyQNA()));
            },
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      15.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/mindtrick.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(color: Colors.redAccent[700],width: 3,),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey[200],
                    child: Text(
                      'Mind Trick Questions',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent[400],
                        fontFamily: 'VT323',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => MindTrickQNA()));
            },
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      15.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/funnytricky.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(color: Colors.redAccent[700],width: 3,),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey[200],
                    child: Text(
                      'Funny Tricky Questions',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent[400],
                        fontFamily: 'VT323',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => FunnyTrickyQNA()));
            },
          ),
        ],
      ),
    );
  }
}