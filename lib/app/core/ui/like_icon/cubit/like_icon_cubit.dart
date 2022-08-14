import 'package:bloc/bloc.dart';

part 'like_icon_state.dart';

class LikeIconCubit extends Cubit<LikeIconState> {
  LikeIconCubit() : super(const LikeIconStateInitial());

  void changeData(bool data) {
    emit(LikeIconStateData(!data));
  }
}
