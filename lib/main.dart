import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/services/provider/note_data_provider.dart';
import 'package:todo_app/ui/screens/notes_screen.dart';
import 'package:todo_app/ui/shared/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: kDarkBgColor,
          scaffoldBackgroundColor: kDarkBgColor,
        ),
        home: NoteScreen(),
      ),
    );
  }
}
