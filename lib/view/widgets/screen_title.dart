import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {

  final String title;

  const ScreenTitle({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),
    );

  }

}