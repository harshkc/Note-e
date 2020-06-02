import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/enums/state_view.dart';

class StateModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;
  ViewState get state => _viewState;

  void setState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }
}
