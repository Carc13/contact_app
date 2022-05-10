import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class NoContacts extends StatelessWidget {
  const NoContacts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Text(
        "No tienes contactos",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: CustomColors.accentColor.withOpacity(0.6),
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),
      ),
    );

  }

}