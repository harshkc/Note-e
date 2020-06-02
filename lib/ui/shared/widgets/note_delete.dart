import 'package:flutter/material.dart';
import 'package:todo_app/ui/shared/constant.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kDarkBgColor,
      title: Text(
        "Warning!",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Are You sure you want to delete ?",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white),
          ),
          color: kRedColor,
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "No",
            style: TextStyle(color: kRedColor),
          ),
          color: Colors.white,
        ),
      ],
    );
  }
}
