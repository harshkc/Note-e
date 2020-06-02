import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/note.dart';
import 'package:todo_app/core/services/provider/note_data_provider.dart';
import 'package:todo_app/ui/shared/constant.dart';

class AddNoteScreen extends StatelessWidget {
  final Note _note = Note();

  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteData>(context);

    return Container(
      color: kDarkBgColor,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: kRedColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                "Add note",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "pacifico",
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              validator: (value) {
                if (value.isEmpty && value.trim() != "") {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter Title",
                hintStyle: TextStyle(color: Colors.white),
              ),
              autofocus: true,
              cursorColor: kDarkBgColor,
              textAlign: TextAlign.center,
              onChanged: (val) {
                _note.noteTitle = val;
              },
            ),
            SizedBox(height: 10.0),
            TextFormField(
              validator: (value) {
                if (value.isEmpty && value.trim() != "") {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter Content",
                hintStyle: TextStyle(color: Colors.white),
              ),
              cursorColor: kDarkBgColor,
              textAlign: TextAlign.center,
              onChanged: (val) {
                _note.noteContent = val;
              },
            ),
            SizedBox(height: 15.0),
            Center(
              child: FlatButton(
                child: Text(
                  "Add note",
                  style: TextStyle(
                    color: kRedColor,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  noteData.addNote(note: _note);
                  Navigator.pop(context);
                },
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
