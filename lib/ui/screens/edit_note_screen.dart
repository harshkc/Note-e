import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/note.dart';
import 'package:todo_app/core/services/provider/note_data_provider.dart';
import 'package:todo_app/ui/shared/constant.dart';

class EditNoteScreen extends StatelessWidget {
  final String noteId;
  EditNoteScreen({this.noteId});
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteData>(context);
    final Note _note = noteData.getnoteByNoteid(noteId);
    _titleEditingController.text = _note.noteTitle;
    _contentEditingController.text = _note.noteContent;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 30.0),
            Center(
              child: Text(
                "Edit note",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "pacifico",
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _titleEditingController,
                    validator: (value) {
                      if (value.isEmpty && value.trim() != "") {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Title",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    autofocus: true,
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    onChanged: (val) {
                      _note.noteTitle = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _contentEditingController,
                    validator: (value) {
                      if (value.isEmpty && value.trim() != "") {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Content",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    onChanged: (val) {
                      _note.noteContent = val;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: FlatButton(
                child: Text(
                  "Edit note",
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
