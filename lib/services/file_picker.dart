import 'dart:io';

abstract class FilePicker {
  Future<File> getFile();
}