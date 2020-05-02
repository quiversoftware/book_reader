import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookContent extends StatelessWidget{
  final List book;
  BookContent(this.book);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Título del libro'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(book[6],
            )
          ],
        ),
      ),

    );
  }
}