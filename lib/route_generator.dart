import 'package:book_reader/screens/book_content.dart';
import 'package:book_reader/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/' :
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/book_content':
        if(args is List){
          return MaterialPageRoute(builder: (_) => BookContent(args));
        }
        return _errorRoute();
      default :
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error route'),
          ),
          body: Center(
            child: Text('This route doesnt exists')
          ),
        );
      }
    );
  }

}