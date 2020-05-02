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
  LoadBook loadBook;
  String textPage = '';
  _MyHomePageState(this._filePicker);
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
          File file = await _filePicker.getFile();
          if(file != null ){
            loadBook = await LoadBook.create(file);
            List book = await loadBook.toList();
            int page = book.length;
            int page2 = await loadBook.totalPages;
            Navigator.of(context).pushNamed('/book_content', arguments: book);
//            print('**********************************');
//            print(page2);
//            print(bok.length);
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
