
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageContent extends StatefulWidget {
  final String page;
  final Function optionsBarToggleCallback;
  final Function showSearchBarCallback;
  PageContent({this.page, this.optionsBarToggleCallback, this.showSearchBarCallback});

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  var textController = new TextEditingController();
  FocusNode _textFieldFocusNode;
  String _selectedText;
//  TextSelectionControls _myTextSelecionControls = materialTextSelectionControls;
  @override
  void initState(){
    super.initState();
    _textFieldFocusNode = FocusNode();
    textController.text = widget.page;
    textController.addListener(_selectedTextLongPress);
    _selectedText = '';
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  void _screenTapped(){
    widget.optionsBarToggleCallback();
    widget.showSearchBarCallback(false, '');
  }

  void _showSearchBar(bool toggle, String selectedText){
    widget.showSearchBarCallback(toggle, selectedText);
  }

  _selectedTextLongPress() {
    int selectionStart = textController.selection.start;
    int selectionEnd = textController.selection.end;
    if(selectionStart >= 0 && selectionEnd >= 0){
      _selectedText = textController.text.substring(selectionStart, selectionEnd);
      if(_selectedText.length > 0){
        print('is a long press with: ' + _selectedText);
        _showSearchBar(true, _selectedText);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
            onTap: () => _screenTapped(),
            child: Container(
              alignment: Alignment.center,
              child: TextField(
                controller: textController,
                textAlign: TextAlign.center,
                decoration: null,
                maxLines: null,
                readOnly: true,
              ),
//              child: EditableText(
//                focusNode: _textfieldFocusNode,
//                controller: textController,
//                backgroundCursorColor: Colors.grey,
//                selectionColor: Colors.blue,
//                style: TextStyle(color: Colors.black, fontSize: 17),
//                cursorColor: Colors.blue,
//                textInputAction: TextInputAction.newline,
//                maxLines: null,
//                enableInteractiveSelection: true,
//                showSelectionHandles: true,
//                readOnly: true,
//                toolbarOptions: ToolbarOptions(copy: true),
//                onSelectionChanged:
//                  (TextSelection textSelection, SelectionChangedCause cause) {
//                    print(textSelection.start);
//                    print(textSelection.end);
//                    print(cause);
//                  },
//                selectionControls: _myTextSelecionControls,
//              ),
              color: Color(0xfffdf5e6),
            )
        ),
      ),
    );
  }
}
