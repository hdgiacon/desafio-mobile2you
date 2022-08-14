import 'package:desafio_mobile2you/app/core/ui/like_icon/cubit/like_icon_cubit.dart';
import 'package:desafio_mobile2you/app/core/ui/like_icon/like_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeIconModule extends StatelessWidget {
  const LikeIconModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LikeIconCubit(),
      child: const LikeIcon(),
    );
  }
}
