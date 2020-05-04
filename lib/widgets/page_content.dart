import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageContent extends StatefulWidget {
  final String page;
  PageContent({this.page});

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  String _page;
  @override
  void initState(){
    super.initState();
    _page = widget.page ?? '';
  }

  void updatePage(String page){
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Text(_page),
      ),
    );
  }
}
