import 'package:desafio_mobile2you/app/core/ui/like_icon/cubit/like_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeIcon extends StatefulWidget {
  const LikeIcon({Key? key}) : super(key: key);

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  //var isLiked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeIconCubit, LikeIconState>(builder: (context, state) {
      final icon = state.isLiked ? Icons.favorite : Icons.favorite_outline;

      return IconButton(
        onPressed: () {
          context.read<LikeIconCubit>().changeData(state.isLiked);
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 28.0,
        ),
      );
    });

    /*
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    const color = Colors.white;

    return IconButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      icon: Icon(
        icon,
        color: color,
        size: 28.0,
      ),
    );
  }
	*/
  }
}
