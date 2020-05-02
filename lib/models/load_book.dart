import 'dart:io';
import 'package:pdf_text/pdf_text.dart';

/// LoadBook: An object which function is load a file
/// a return a PDFDoc

class LoadBook {
  PDFDoc _doc;
  //TODO book title

  LoadBook._create(this._doc);

  static Future<LoadBook> create(File file) async{
    PDFDoc doc = await PDFDoc.fromFile(file);
    return LoadBook._create(doc);
  }

  Future<String> _getText() async{
    String text = await this._doc.text;
    return text;
  }

  Future<int> _getTotalPages() async{
    int totalPages = await this._doc.length;
    return totalPages;
  }

  Future<String> _getPage(pageNumber) async{
    PDFPage page = this._doc.pageAt(pageNumber);
    String pageText = await page.text;
    return pageText;
  }

  Future<List> toList() async{
    List book = new List();
    int totalPages = await _getTotalPages();
    for(var index = 1; index < totalPages; index++) {
      String page = await _getPage(index);
      book.add(page);
    }
    return book;
  }

  Future<String> get text async => _getText();
  Future<int>    get totalPages async => _getTotalPages();
  Future<String> page(int pageNumber) async => _getPage(pageNumber);

}


