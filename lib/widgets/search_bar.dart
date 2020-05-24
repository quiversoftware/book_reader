import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_reader/models/searching_options.dart';

class SearchBar extends StatefulWidget {
  final double height;
  final double width;
  String selectedText;

  SearchBar({this.width, this.height, this.selectedText});

  @override
  _SearchBarState createState() => _SearchBarState();
}


_searchWordIn(String option){
  print(option);
}

class _SearchBarState extends State<SearchBar> {
  var textController = new TextEditingController();
  Map _option0;
  Map _option1;
  Map _option2;
  Map _option3;
  String _dropdownValue;
  double _height, _width;


  @override
  void initState(){
    super.initState();
    SearchingOptions searchingOptions = new SearchingOptions();
    textController.text = widget.selectedText ?? '';

    _dropdownValue = 'RAE';
    _option0 = searchingOptions.options[0];
    _option1 = searchingOptions.options[1];
    _option2 = searchingOptions.options[2];
    _option3 = searchingOptions.options[3];

    _height  = widget.height;
    _width   = widget.width;
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textController.text = widget.selectedText ?? '';
    print('in build SEARCHBAR: ' + textController.text);
    return SizedBox(
      height: _height,
      width: _width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: TextField(
              controller: textController,
              decoration:
                new InputDecoration(
                  border:
                    new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(3.0),
                      ),
                    ),
                  filled: true,
                ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true,  //If false (the default), then the dropdown's menu will be wider than its button.
                  )
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isDense: true,
                    items: [
                      buildDropdownButton(_option0['name'], _option0['emoji']),
                      buildDropdownButton(_option1['name'], _option1['emoji']),
                      buildDropdownButton(_option2['name'], _option2['emoji']),
                      buildDropdownButton(_option3['name'], _option3['emoji']),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _dropdownValue = value;
                        _searchWordIn(_dropdownValue);
                      });
                    },
                    value: _dropdownValue,
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }

  DropdownMenuItem<String> buildDropdownButton(String optionName, String optionIcons) {
    return
      DropdownMenuItem(
        value: optionName,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.search),
            SizedBox(width: 5),
            Text(
              optionIcons.length == 0 ? optionName : optionIcons,
            ),
          ],
        ),
      );
  }
}
