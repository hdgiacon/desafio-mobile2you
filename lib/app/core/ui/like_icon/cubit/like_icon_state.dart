part of 'like_icon_cubit.dart';

abstract class LikeIconState {
  final bool isLiked;

  const LikeIconState(this.isLiked);
}

class LikeIconStateInitial extends LikeIconState {
  const LikeIconStateInitial() : super(false);
}

class LikeIconStateData extends LikeIconState {
  const LikeIconStateData(bool isLiked) : super(isLiked);
}
