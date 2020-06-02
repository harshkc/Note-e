class Note {
  String noteId;
  String noteTitle;
  String noteContent;
  DateTime createdTime;
  DateTime editedTime;

  Note({
    this.noteId,
    this.noteTitle,
    this.noteContent,
    this.createdTime,
    this.editedTime,
  });

  ///FROM JSON
  Note.fromMap(Map note) {
    this.noteId = note["nodeId"];
    this.noteTitle = note["noteTitle"];
    this.noteContent = note["noteContent"] ?? "null";
    this.createdTime = DateTime.parse(note["createDateTime"]);
    this.editedTime = note["latestEditDateTime"] != null
        ? DateTime.parse(note["latestEditDateTime"])
        : DateTime.parse(note["createDateTime"]);
  }

  ///TO JSON
  Map<String, dynamic> toMap(Note note) {
    Map<String, dynamic> noteMap = Map();
    noteMap["nodeId"] = note.noteId;
    noteMap["noteTitle"] = note.noteTitle;
    noteMap["noteContent"] = note.noteContent;
    noteMap["createDateTime"] = note.createdTime;
    noteMap["latestEditDateTime"] = note.editedTime;
    return noteMap;
  }
}
