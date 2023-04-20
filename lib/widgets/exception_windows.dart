import 'package:flutter/material.dart';

class ExceptionsWindows extends StatelessWidget {
  const ExceptionsWindows({required this.onTap, Key? key}) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Exception"),
            TextButton(
              onPressed: () {
                onTap.call();
              },
              child: const Text(
                "Ok",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
