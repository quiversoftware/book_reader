import 'package:book_reader/widgets/page_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookContent extends StatelessWidget{
  final List book;
  int _selectedIndex = 0;
  BookContent(this.book);

  void _onItemTapped(int index) {
      _selectedIndex = index;
      print(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Título del libro'),
      ),
      body: Container(
        child: PageContent(
            page: count.toString(),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), title: Text("Blue")),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), title: Text("Red")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

    );
  }
}