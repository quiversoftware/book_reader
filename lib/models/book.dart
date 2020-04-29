import 'dart:io';
import 'package:pdf_text/pdf_text.dart';

class Book {
  PDFDoc _doc;
//  String _text;
//  int _totalPages;

  Book._create(this._doc);

  void create(File file) async{
    PDFDoc doc = await PDFDoc.fromFile(file);
    Book._create(doc);
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

  Future<String> get text async => _getText();
  Future<int>    get totalPages async => _getTotalPages();
  Future<String> get page async => _getPage(int);

}


