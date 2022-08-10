import 'package:flutter/material.dart';

class LikeIcon extends StatefulWidget {
  const LikeIcon({Key? key}) : super(key: key);

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  var isLiked = false;

  @override
  Widget build(BuildContext context) {
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
}
