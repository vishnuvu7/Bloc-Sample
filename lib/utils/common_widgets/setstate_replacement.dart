import 'package:bloc/bloc.dart';

class ToggleAnything extends Cubit<bool> {
  ToggleAnything() : super(false); // <=== Initial State
  bool anyCondition = false;

  void changeState() {
    if (anyCondition) {
      // change state according to condition
      emit(true);
    } else {
      emit(false);
    }
  }
}

class ChangeStringData extends Cubit<String> {
  ChangeStringData() : super("");
  bool anyCondition = false;

  void changeString() {
    if (anyCondition) {
      emit("Hello");
    } else {
      emit("Hai");
    }
  }
}
