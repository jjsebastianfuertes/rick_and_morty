import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key key,
    @required this.content,
    @required this.title,
  }) : super(key: key);

  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: title,
        style: Theme.of(context).textTheme.subtitle1,
        children: <TextSpan>[
          TextSpan(
            text: content,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
