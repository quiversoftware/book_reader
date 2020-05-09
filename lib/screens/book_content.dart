import 'package:book_reader/widgets/bottom_book_bar.dart';
import 'package:book_reader/widgets/page_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookContent extends StatefulWidget{
  final List book;
  BookContent(this.book);

  @override
  _BookContentState createState() => _BookContentState();
}

class _BookContentState extends State<BookContent> {
  bool _isVisible = true;
  int count = 0;

  void _hideOptions(){
    print('has been touched');
    setState(() {
      _isVisible = _isVisible ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PageContent(
                      hideOptionsCallback: _hideOptions,
                    ),
                  ],
                ),
              )
          ),
          Visibility (
            visible: _isVisible,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomBookBar(),
            ),
          )
        ],
      ),
    );
  }

}