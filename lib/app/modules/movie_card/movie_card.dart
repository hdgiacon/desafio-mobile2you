import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(
        Icons.circle_notifications,
        color: Colors.white,
        size: 15.0,
      ),
      leading: const Icon(
        Icons.alarm,
        color: Colors.white,
      ),
      title: const Text(
        'Nome',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Row(
        children: const [
          Text(
            'year',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            'Gender',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
