import 'package:flutter/material.dart';
import 'package:todo_app/core/services/provider/note_data_provider.dart';
import 'package:todo_app/ui/screens/edit_note_screen.dart';
import 'package:todo_app/ui/shared/widgets/note_delete.dart';
import 'package:todo_app/ui/shared/widgets/tile_list.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, noteData, child) {
        return ListView.builder(
          itemCount: noteData.itemsCount,
          itemBuilder: (context, index) {
            final note = noteData.notes[index];
            return Dismissible(
              key: ValueKey(note.noteId),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final bool result = await showDialog(
                    context: context, builder: (context) => NoteDelete());
                result != true ? print("Canceled") : noteData.deleteNote(note);
                return result;
              },
              background: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  child: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              child: TileList(
                title: note.noteTitle,
                subTitle: note.editedTime.toString(),
                isDeleted: false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditNoteScreen(noteId: note.noteId),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
