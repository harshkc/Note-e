import 'package:flutter/foundation.dart';

class NoteInsert {
  final String noteTitle;
  final String noteContent;

  NoteInsert({
    @required this.noteTitle,
    @required this.noteContent,
  });

  Map<String, dynamic> toJson() {
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent,
    };
  }
}
