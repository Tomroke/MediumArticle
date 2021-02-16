import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Medium Article',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ArticleList(),
    );
  }
}

class ArticleList extends StatelessWidget {
  final txtList = ["First", "Second", "Third"];
  final colourList = [Colors.blue, Colors.blueAccent, Colors.blueGrey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Example'),
    ),
    body: ListView.builder(
        itemCount: txtList.length,
        itemBuilder: (context, index){
          return Button(txtList[index], colourList[index]);
        },
    )
    );
  }
}

class Button extends StatelessWidget {
  final String buttonText;
  final buttonColour;

  Button(this.buttonText, this.buttonColour);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: TextButton(
        key: Key('textButtonKey'),
        child: Text(buttonText),
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: buttonColour,
            minimumSize: Size(100, 50),
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 50
            ),
            textStyle: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic
            )
        ),
        onPressed:() {
          final snackBar = SnackBar(
            content: Text(buttonText),
            action: SnackBarAction(
              label: '',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}