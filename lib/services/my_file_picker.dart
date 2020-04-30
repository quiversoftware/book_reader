import 'dart:io';
import 'package:book_reader/services/implementations/my_file_picker_impl.dart';

abstract class MyFilePicker {
  factory MyFilePicker() { // make MyFilePicker appear to be instantiable
    return new MyFilePickerImpl();
  }
  MyFilePicker.constructor();

  Future<File> getFile();
}