import 'package:flutter/material.dart';

class TileVertical extends StatelessWidget {
  const TileVertical({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          content,
          style: TextStyle(fontSize: 35),
        ),
      ],
    );
  }
}
