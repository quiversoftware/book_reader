import 'dart:io';
import 'package:book_reader/models/load_book.dart';
import 'package:book_reader/screens/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingBook extends StatefulWidget {
  final File file;
  LoadingBook(this.file);

  @override
  _LoadingBookState createState() => _LoadingBookState();
}

class _LoadingBookState extends State<LoadingBook> {
  File _file;

  @override
  void initState(){
    super.initState();
    _file = widget.file;
    _initBook();
  }

  _initBook() async {
    LoadBook loadBook = await LoadBook.create(_file);
    List book = await loadBook.toList();
    int page = book.length;
    int page2 = await loadBook.totalPages;
    Navigator.of(context).pushNamed('/book_content', arguments: book);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}
