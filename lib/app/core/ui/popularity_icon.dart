import 'package:flutter/material.dart';

class PopularityIcon extends StatelessWidget {
  final double popularity;

  const PopularityIcon({
    super.key,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.0,
          color: Colors.white,
        ),
      ),
      child: Container(
        height: popularity,
        width: 20.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
