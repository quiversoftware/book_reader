class GoogleImage {
  final String kind;
  final String title;
  final String link;
  final String displayLink;
  final String snippet;
  final String htmlSnippet;
  final String mime;
  final String fileFormat;
  final String image;

  GoogleImage({this.kind, this.title, this.link, this.displayLink, this.snippet,
    this.htmlSnippet, this.mime, this.fileFormat, this.image});

  factory GoogleImage.fromJson(Map<String, dynamic> json) {
    return GoogleImage(
        kind: json['kind'] as String,
        title: json['title'] as String,
        link: json['link'] as String,
        displayLink: json['displayLink'] as String,
        snippet: json['snippet'] as String,
        htmlSnippet: json['htmlSnippet'] as String,
        mime: json['mime'] as String,
        fileFormat: json['fileFormat'] as String
    );
  }
}