import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState());

  void changeCurrentIndex(int index) {
    emit(state.copyWith(status: NavStatus.loading));
    print(index);
    emit(state.copyWith(index: index, status: NavStatus.success));
  }

  void reset() {
    print("reset called");
    emit(
      state.copyWith(
        index: 0,
        status: NavStatus.success,
      ),
    );
  }
}
