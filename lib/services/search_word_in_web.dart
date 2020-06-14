/// Class which fetch a spanish word definition in RAE web page

abstract class SearchWordInWeb{
  Future<String> getDefinition(String word);
}