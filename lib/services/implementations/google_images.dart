import 'dart:convert';
import 'package:book_reader/services/search_images.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:book_reader/constants.dart';
import 'package:http/http.dart' as http;
import 'package:book_reader/models/google_image.dart';


class GoogleImages extends SearchImages{
  String googleImageUrl;

  GoogleImages(){
    googleImageUrl = GOOGLE_CUSTOM_SEARCH['baseUrl'] + '&' +
        GOOGLE_CUSTOM_SEARCH['apiKey'] + '&' +
        GOOGLE_CUSTOM_SEARCH['cx'];
  }

  @override
  Future<List<GoogleImage>> getImages(http.Client client, String wordToSearch) async{
    Response response = await fetchPost(client, wordToSearch);

    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Response> fetchPost(http.Client client, String wordToSearch) {
    wordToSearch = wordToSearch.toLowerCase();
    googleImageUrl = googleImageUrl + '&' +
        GOOGLE_CUSTOM_SEARCH['query'].replaceFirst('#query', wordToSearch) + '&' +
        GOOGLE_CUSTOM_SEARCH['searchType'] + '&' +
        GOOGLE_CUSTOM_SEARCH['imageSize'] + '&' +
        GOOGLE_CUSTOM_SEARCH['altJson'] ;

    return client.get(googleImageUrl);
  }

}

// A function that converts a response body into a List<Photo>.
List<GoogleImage> parsePhotos(String responseBody) {
  var responseDecoded = jsonDecode(responseBody);
  responseDecoded = responseDecoded[GOOGLE_CUSTOM_SEARCH['imagesJsonElementName']];
  final parsed = responseDecoded.cast<Map<String, dynamic>>();
  return parsed.map<GoogleImage>((json) => GoogleImage.fromJson(json)).toList();
}