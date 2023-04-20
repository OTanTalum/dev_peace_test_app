import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({required this.name, Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: 170,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.lime,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          name,
        ),
      ),
    );
  }
}
