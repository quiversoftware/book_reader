import 'dart:io';
import 'package:book_reader/services/my_file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_reader/models/book.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(new MyFilePicker());
}

class _MyHomePageState extends State<MyHomePage> {
  MyFilePicker _filePicker;
  Book book;
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
            book = await Book.create(file);
            String page = await book.page(50);
            setState(() {
              textPage = page;
            });
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
