import 'package:flutter/material.dart';
import './quote.dart';
import './quote_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuoteList(),
    );
  }
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: '- Gandhi',
        text: 'You must be the change you wish to see in the world.'),
    Quote(
        author: '- Albert Einstein',
        text:
            'Everybody is a genius. But if you judge a fish by its ability to climb a tree, it will live its whole life believing that it is stupid.'),
    Quote(
        author: '- George Bernhard Shaw',
        text:
            'A life spent making mistakes is not only more honorable, but more useful than a life spent doing nothing.'),
    Quote(
        author: '- Michel De Montaigne',
        text: 'He who fears he will suffer, already suffers because he fears.'),
    Quote(
        author: '- Mother Theresa',
        text:
            'We think sometimes that poverty is only being hungry, naked and homeless. The poverty of being unwanted, unloved and uncared for is the greatest poverty.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Your Quote'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: quotes
                .map((quote) => QuoteCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                        quotes.remove(quote);
                      });
                    }))
                .toList(),
          ),
        ),
      ),
    );
  }
}
