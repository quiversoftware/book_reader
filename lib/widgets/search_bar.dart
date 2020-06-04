import 'package:book_reader/constants.dart';
import 'package:book_reader/widgets/raeDialog.dart';
import 'package:book_reader/widgets/translateDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_reader/services/implementations/spanish_word_definition.dart';
import 'package:translator/translator.dart';


class SearchBar extends StatefulWidget {
  final double height;
  final double width;
  String selectedText;
  final translator = new GoogleTranslator();

  SearchBar({this.width, this.height, this.selectedText});

  @override
  _SearchBarState createState() => _SearchBarState();
}


class _SearchBarState extends State<SearchBar> {
  var textController = new TextEditingController();
  Map _option0;
  Map _option1;
  Map _option2;
  Map _option3;
  String _dropdownValue;
  double _height, _width;
  SpanishWordDefinition spanishWordDefinition;

  _searchWordIn(String option, String wordToSearch) async{
    String definitionInHtml, translatedWord;
    if(option == SEARCH_OPTION[0]) { //option == RAE
      definitionInHtml = await spanishWordDefinition.getDefinition(wordToSearch);
    }else if(option == SEARCH_OPTION[1]){ //ing -> Esp
      translatedWord = await widget.translator.translate(wordToSearch, from: 'en', to: 'es');
    } else{ // fra -> Esp
      translatedWord = await widget.translator.translate(wordToSearch, from: 'fr', to: 'es');
    }
    return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          switch(option){
            case 'RAE' :
              return RaeDialog(
                  title: wordToSearch,
                  definitionHtml: definitionInHtml
              );
              break;
            case 'ing_esp' :
              return TranslateDialog(
                  wordToTranslate: wordToSearch,
                  translatedWord: translatedWord
              );
            case 'fra_esp' :
              return TranslateDialog(
                  wordToTranslate: wordToSearch,
                  translatedWord: translatedWord
              );
              break;
            default :
              return TranslateDialog(
                  wordToTranslate: wordToSearch,
                  translatedWord: translatedWord
              );
          }
        },
    );
  }

  @override
  void initState(){
    super.initState();
    spanishWordDefinition = new SpanishWordDefinition();
    textController.text = widget.selectedText ?? '';

    _dropdownValue = 'RAE';
    _option0 = SEARCH_OPTIONS_DATA[0];
    _option1 = SEARCH_OPTIONS_DATA[1];
    _option2 = SEARCH_OPTIONS_DATA[2];
    _option3 = SEARCH_OPTIONS_DATA[3];

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
                        _searchWordIn(_dropdownValue, textController.text);
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
