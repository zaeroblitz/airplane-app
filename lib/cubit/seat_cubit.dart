import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (isSelected(id)) {
      state.remove(id);
    } else {
      state.add(id);
      state.sort();
    }
    emit(List.from(state));
  }

  bool isSelected(String id) {
    if (state.contains(id)) {
      return true;
    } else {
      return false;
    }
  }
}
