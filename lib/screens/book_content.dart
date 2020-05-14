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
  int _index = 0;
  String _page = '';

  @override
  void initState(){
    super.initState();
    _page = widget.book[_index];
  }


  void _hideOptions(){
    print('has been touched');
    setState(() {
      _isVisible = _isVisible ? false : true;
    });
  }

  void _nextPage(){
    setState(() {
      print('init index: ' + _index.toString());
      if(_index < widget.book.length - 1){
        _index++;
        _page = widget.book[_index];
        print(_page);
      }
    });
  }

  void _previousPage(){
    setState(() {
      print('init index: ' + _index.toString());
      if(_index > 0){
        _index--;
        _page = widget.book[_index];
        print(_page);
      }
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
                      page: _page,
                    ),
                  ],
                ),
              )
          ),
          Visibility (
            visible: _isVisible,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomBookBar(
                nextPageCallback: _nextPage,
                previousPageCallback: _previousPage,
              ),
            ),
          )
        ],
      ),
    );
  }

}