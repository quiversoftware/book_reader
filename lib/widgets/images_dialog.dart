
import 'package:book_reader/models/google_image.dart';
import 'package:book_reader/services/implementations/google_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ImagesDialog extends StatefulWidget {
  final String wordToSearch;
  final GoogleImages googleImages = new GoogleImages();
  ImagesDialog({this.wordToSearch});

  @override
  _ImagesDialogState createState() => _ImagesDialogState();
}


class _ImagesDialogState extends State<ImagesDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.image),
          Text(
              widget.wordToSearch
          )
        ],
      ),
      content: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: new Container(
            // Specify some width
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .7,
            child: FutureBuilder<List<GoogleImage>>(
              future: widget.googleImages.getImages(http.Client(), widget.wordToSearch),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? GoogleImagesList(googleImages: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleImagesList extends StatelessWidget {
  final List<GoogleImage> googleImages;
  GoogleImagesList({Key key, this.googleImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemCount: googleImages.length,
      itemBuilder: (context, index) {
        return Container(
          child: Image.network(googleImages[index].link),
          padding: EdgeInsets.all(3.0),
          color: Colors.teal[200],
        );

      },
    );
  }
}