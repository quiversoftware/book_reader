import 'package:book_reader/widgets/bottom_book_bar.dart';
import 'package:book_reader/widgets/page_content.dart';
import 'package:book_reader/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookContent extends StatefulWidget{
  final List book;
  BookContent(this.book);

  @override
  _BookContentState createState() => _BookContentState();
}

class _BookContentState extends State<BookContent> {
  bool _showOptionsBar = false;
  bool _searchBarToggle = false;
  int _index = 0;
  String _page = '';
  String _selectedText;

  @override
  void initState(){
    super.initState();
    _page = widget.book[_index];
    _selectedText = '';
  }


  void _optionsBarToggle(){
    print('Toggling options bar');
    setState(() {
      _showOptionsBar = _showOptionsBar ? false : true;
    });
  }

  void _showSearchBar(bool toggle, String selectedText){
//    print('Toggling search bar');
    setState(() {
      _searchBarToggle  = toggle;
      _selectedText     = selectedText;
      print('in book_content: ' + _selectedText);
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
                      optionsBarToggleCallback: _optionsBarToggle,
                      showSearchBarCallback: _showSearchBar,
                      page: _page,
                    ),
                  ],
                ),
              )
          ),

          Visibility(
            visible: _searchBarToggle,
            child: Positioned(
              top: 30,
              left: MediaQuery.of(context).size.width * 0.10,
              child: Align(
                alignment: Alignment.topCenter,
                child: SearchBar(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.80,
                  selectedText: _selectedText,
                )
              ),
            )
          ),
          Visibility (
            visible: _showOptionsBar,
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