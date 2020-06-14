import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslateDialog extends StatelessWidget {
  final String wordToTranslate;
  final String translatedWord;

  TranslateDialog({this.translatedWord, this.wordToTranslate});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.translate),
            Text(wordToTranslate)
          ],
        ),
        content: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  translatedWord,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text(
                  'Español',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  ),
                )
              ]
            ),
          ),
        ),
    );
  }

}
