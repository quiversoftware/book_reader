import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class RaeDialog extends StatefulWidget {
  final String title;
  final String definitionHtml;

  RaeDialog({this.title, this.definitionHtml});

  @override
  _RaeDialogState createState() => _RaeDialogState();
}

class _RaeDialogState extends State<RaeDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: Text(widget.title),
          content: Scrollbar( child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children: <Widget>[
                  Html(
                  data: """${widget.definitionHtml}""",
                    style: {
                      "mark": Style(
                        backgroundColor: Colors.white70,
                      ),
                      "u" : Style(
                          color: Colors.brown
                      ),
                      "em" : Style(
                          color: Colors.brown
                      ),
                      ".n_acep": Style(
                          fontWeight: FontWeight.bold
                      )
                    },
                  ),
                ]
            ),
          ),
          ),
        );
      }
  }
