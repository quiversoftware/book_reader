import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageContent extends StatefulWidget {
  final String page;
  final Function hideOptionsCallback;
  PageContent({this.page, this.hideOptionsCallback});

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  @override
  void initState(){
    super.initState();
  }

  void screenTapped(){
    widget.hideOptionsCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
            onTap: () => screenTapped(),
            child: Container(
              alignment: Alignment.center,
              child: SelectableText(
                widget.page,
                textAlign: TextAlign.center,
              ),
              color: Color(0xfffdf5e6),
            )
        ),
      ),
    );
  }
}
