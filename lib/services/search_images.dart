import 'package:book_reader/models/google_image.dart';
import 'package:http/http.dart' as http;
/// Class which fetch an array of images from google images

abstract class SearchImages{
  Future<List<GoogleImage>> getImages(http.Client client, String word);
}