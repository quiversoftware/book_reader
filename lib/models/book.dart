import 'dart:io';
import 'package:pdf_text/pdf_text.dart';

class Book {
  PDFDoc _doc;

  Book._create(this._doc);

  static Future<Book> create(File file) async{
    PDFDoc doc = await PDFDoc.fromFile(file);
    return Book._create(doc);
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
  Future<String> page(int pageNumber) async => _getPage(pageNumber);

}


