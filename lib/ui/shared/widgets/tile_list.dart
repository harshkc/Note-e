import 'package:flutter/material.dart';

class TileList extends StatelessWidget {
  final bool isDeleted;
  final String subTitle;
  final String title;
  final Function onTap;

  TileList({
    @required this.title,
    @required this.subTitle,
    this.isDeleted,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isDeleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text("Last Edited on $subTitle"),
      onTap: onTap,
    );
  }
}
