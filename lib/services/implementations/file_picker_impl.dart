import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerImpl implements FilePicker {

  @override
  Future<File> getFile() async {
    File file = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: [ 'pdf'],
    );
    return file;
  }

//  void getFile() async {
//    String path;
//    bool loadingPath = false;
//    String extension = 'pdf';
//    setState(() => loadingPath = true);
//    try {
//      path = await FilePicker.getFilePath(
//          type: FileType.custom,
//          allowedExtensions: (extension?.isNotEmpty ?? false)
//              ? extension?.replaceAll(' ', '')?.split(',')
//              : null);
//    } on PlatformException catch (e) {
//      print("Unsupported operation" + e.toString());
//    }
//    if (!mounted) return;
//    setState(() {
//      loadingPath = false;
//      if(path != null) _fileName = path.split('/').last;
//    });
//    print(_fileName);
//  }
}