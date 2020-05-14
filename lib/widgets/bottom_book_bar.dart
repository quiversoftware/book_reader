import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBookBar extends StatelessWidget {
  final VoidCallback nextPageCallback;
  final VoidCallback previousPageCallback;

  BottomBookBar({this.previousPageCallback, this.nextPageCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          PaginationButton(
            topLeftRadius: 12.0,
            topRightRadius: 0.0,
            iconData: Icons.chevron_left,
            buttonAction: _printLeft,
          ),
          PaginationButton(
            topLeftRadius: 0.0,
            topRightRadius: 0.0,
            iconData: Icons.dehaze,
            buttonAction: _printCenter,
          ),
          PaginationButton(
            topLeftRadius: 0.0,
            topRightRadius: 12.0,
            iconData: Icons.chevron_right,
            buttonAction: _printRight,
          ),
        ],
    );
  }

  void _printLeft(){
    print('left button');
    previousPageCallback();
  }

  void _printRight(){
    print('right button');
    nextPageCallback();
  }

  void _printCenter(){
    print('center button');
  }

}

class PaginationButton extends StatelessWidget {
  final num topLeftRadius;
  final num topRightRadius;
  final IconData iconData;
  final VoidCallback buttonAction;

  PaginationButton({this.buttonAction, this.topLeftRadius,
    this.topRightRadius, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black54, Colors.transparent])),
      height: MediaQuery.of(context).size.height * 0.05,
      child: RaisedButton(
        onPressed: () => buttonAction(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
            )
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Icon(
                iconData,
                color: Colors.black,
                size: 20
            ),
          ),
        ),
        color: Colors.transparent,
        textColor: Colors.white,
      ),
    );
  }
}
