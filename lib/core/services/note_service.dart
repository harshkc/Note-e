import 'dart:convert';

import 'package:todo_app/core/models/api_response.dart';
import 'package:todo_app/core/models/note.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/core/models/note_insert.dart';

class NoteService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': '5434f028-ef51-4303-8978-6b7f93be3f99',
    'Content-Type': 'application/json'
  };

  ///FETCHING ALL NOTES FROM API
  Future<ApiResponse<List<Note>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        final notes = <Note>[];
        for (var item in jsonData) {
          final note = Note.fromMap(item);
          notes.add(note);
        }
        return ApiResponse<List<Note>>(data: notes);
      }
      return ApiResponse<List<Note>>(
          error: true,
          errorMessage:
              "fetching api status code ${data.statusCode} error occured");
    }).catchError((_) => ApiResponse<List<Note>>(
        error: true, errorMessage: " http error occured"));
  }

  ///FETCHING NOTE BY ID
  Future<ApiResponse<Note>> getNotesById(String noteId) {
    return http.get(API + '/notes/' + noteId, headers: headers).then((data) {
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        final note = Note.fromMap(jsonData);
        return ApiResponse<Note>(data: note);
      }
      return ApiResponse<Note>(
          error: true,
          errorMessage:
              "fetching api status code ${data.statusCode} error occured");
    }).catchError((_) =>
        ApiResponse<Note>(error: true, errorMessage: " http error occured"));
  }

  ///POSTING NOTE TO API
  Future<ApiResponse<bool>> createNote(NoteInsert newNote) {
    return http
        .post(API + '/notes',
            headers: headers, body: json.encode(newNote.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return ApiResponse<bool>(data: true);
      }
      return ApiResponse<bool>(
          error: true,
          errorMessage: "fetching api - ${data.statusCode} error occured");
    }).catchError((_) => ApiResponse<bool>(
            error: true, errorMessage: " http error occured"));
  }
}
