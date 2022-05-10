import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class ContactLogo extends StatelessWidget {

  final String lastName;
  final String name;

  const ContactLogo({ Key? key, required this.name, required this.lastName }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomColors.accentColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: CustomColors.backgroundColor,
          width: 2
        )
      ),
      child: Text(
        name[0] + lastName[0],
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),
      ),
    );

  }

}