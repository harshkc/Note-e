import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/enums/state_view.dart';
import 'package:todo_app/core/services/provider/note_data_provider.dart';
import 'package:todo_app/ui/screens/add_note_screen.dart';
import 'package:todo_app/ui/shared/constant.dart';
import 'package:todo_app/ui/shared/widgets/note_list.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteData>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
        backgroundColor: Colors.white,
        foregroundColor: kRedColor,
        hoverElevation: 5.0,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddNoteScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                CircleAvatar(
                  child: Icon(
                    Icons.content_paste,
                    size: 40.0,
                    color: kRedColor,
                  ),
                  backgroundColor: Colors.white,
                  radius: 40.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Note-e",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: "pacifico",
                    color: Colors.white,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${noteData.itemsCount} notes",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "pacifico",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: kRedColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: noteData.state == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : noteData.itemsCount == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70.0),
                          child: Center(
                            child: Text(
                              noteData.errorMessage ??
                                  "add new notes and begin your awesome journey with us",
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: "pacifico"),
                            ),
                          ),
                        )
                      : NoteList(),
            ),
          ),
        ],
      ),
    );
  }
}
