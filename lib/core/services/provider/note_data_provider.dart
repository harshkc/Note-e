import 'dart:collection';
import 'package:todo_app/core/enums/state_view.dart';
import 'package:todo_app/core/models/api_response.dart';
import 'package:todo_app/core/models/note.dart';
import 'package:todo_app/core/services/note_service.dart';
import 'package:todo_app/core/services/provider/state_model.dart';

class NoteData extends StateModel {
  NoteService _service = NoteService();
  ApiResponse<List<Note>> _apiResponse = ApiResponse();

  List<Note> _notes = [];
  String errorMessage;

  NoteData() {
    fetchAllNotes();
  }

  fetchAllNotes() async {
    setState(ViewState.Busy);
    _apiResponse = await _service.getNotesList();
    if (_apiResponse.error) {
      errorMessage = _apiResponse.errorMessage;
    }
    List<Note> notesApi = _apiResponse.data;
    _notes = notesApi;
    setState(ViewState.Idle);
    notifyListeners();
  }

  UnmodifiableListView<Note> get notes {
    return UnmodifiableListView(_notes);
  }

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  void updateNote(String noteId, Note newNote) {
    for (var note in _notes) {
      if (note.noteId == noteId) {
        note.noteTitle = newNote.noteTitle;
        note.noteTitle = newNote.noteContent;
        note.editedTime = DateTime.now();
      }
    }
    notifyListeners();
  }

  int get itemsCount {
    return _notes?.length ?? 0;
  }

  void addNote({Note note}) {
    _notes.add(note);
    notifyListeners();
  }

  Note getnoteByNoteid(String noteId) {
    return _notes.firstWhere((note) => note.noteId == noteId);
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }
}
