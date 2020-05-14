import 'dart:io';
import 'package:book_reader/services/my_file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_reader/models/load_book.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(new MyFilePicker());
}

class _MyHomePageState extends State<MyHomePage> {
  MyFilePicker _filePicker;
  _MyHomePageState(this._filePicker);

  LoadBook loadBook;
  String textPage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Push an pdf:',
            ),
            Text(
              textPage,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
//          File file = await _filePicker.getFile();
//          if(file != null ){
//            Navigator.of(context).pushNamed('/loading_book', arguments: file);
//          }
          List list = new List();
          list.add('page1 - The Conference on Information and Knowledge Management (CIKM) is a key event for the international academic, '
              'business and government communities to discuss research on information retrieval, data science, and knowledge management. '
              'CIKM is uniquely situated to highlight '
              'technologies and insights that materialize the big data and artificial intelligence vision of the future.');
          list.add('page2 - CIKM 2020 will be a fully virtual conference, with no travel involved, and presentations will be given '
              'via pre-recorded videos, followed by synchronized online discussions during the scheduled conference period.');
          list.add('page3 - Topics of Interest  '
              'We encourage submissions of high-quality research papers on all topics in the general areas of'
              ' artificial intelligence, databases, information retrieval, and knowledge management. Topics of interest include,'
              ' but are not limited to, the following areas:');
          Navigator.of(context).pushNamed('/book_content', arguments: list);

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
