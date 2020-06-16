import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
          debugShowCheckedModeBanner: false,
          home: CupertinoPageScaffold(
                child:RandomWords()     ) 
    );
  }
}



class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
 
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
          debugShowCheckedModeBanner: false,
          home: CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('StartUp Namer'),
                  ),
                  child: Center(
                    child:_buildSuggestions(),
                    
                  ),
          ),
    );
  }
  Widget _buildSuggestions() {
  final _suggestions = <WordPair>[];
      return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {

        if (i.isOdd) return Spacer(); 
        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
           _suggestions.addAll(generateWordPairs().take(10)
           
        );
           
        }
        return _buildRow(_suggestions[index]);
      });  
  }

  Widget _buildRow(WordPair pair) {
    return  Container(
      height: 65,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide( 
            color: Color.fromARGB(255, 128, 128, 128),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
                    Text(
                       pair.asPascalCase,
                       style: TextStyle(
                        fontSize: 25,

                        )
                    ),
              ],
            ),
    );
   

  }

  
}

