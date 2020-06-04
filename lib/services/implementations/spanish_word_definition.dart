import 'package:book_reader/services/search_word_in_web.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:book_reader/constants.dart' as Constants;

class SpanishWordDefinition extends SearchWordInWeb{
  String baseUrl;
  static const RAE = Constants.RAE;

  SpanishWordDefinition(){
    baseUrl = Constants.SEARCH_OPTIONS_DATA.firstWhere((option) => option['name'] == 'RAE')['baseUrl'];
  }


  @override
  Future<String> getDefinition(String wordToSearch) async{
    String definition = '';
    Response response = await fetchPost(wordToSearch);
    int responseStatus = response.statusCode;
    //if connection was successful
    switch(responseStatus) {
      case 200:
        {
          var document = parse(response.body);
          Element definitionBody = document.getElementById(RAE['resultsClassName']); //search Results body
          List<Element> definitionBlocks = definitionBody.getElementsByTagName(RAE['definitionTagName']); //search definitions div
          if(definitionBlocks.isEmpty){
            //There is not definition in dictionary
            definition = definitionBody.getElementsByTagName('span')[0].innerHtml;
          }else{
            // remove header
            Element definitionBlock = definitionBlocks[RAE['definitionsBloc']];
            definitionBlock.children[0].firstChild.remove();
            // ---
            definition = definitionBlocks[RAE['definitionsBloc']].innerHtml;
          }
        }
    }
    return definition;
  }

  List<String> getDefinitions(List<Node> definitionsNodes){
    List<String> definitions = new List();
    definitionsNodes.forEach((definitionNode) {
      definitions.add(constructDefinition(definitionNode));
    });
    return definitions;
  }

  String constructDefinition(Node definitionNode){
    String definition = '';
    List<Element> nodeChildren = definitionNode.children;
    nodeChildren.forEach((content) => definition = definition + ' ' + content.firstChild.toString().replaceAll('"', ''));
    return definition;
  }

  Future<Response> fetchPost(String wordToSearch) {
    wordToSearch = wordToSearch.toLowerCase();
    return get(baseUrl + wordToSearch + '?m=form');
  }



}