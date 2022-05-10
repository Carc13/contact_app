import 'package:flutter/material.dart';

import '../../../models/contact_model.dart';
import '../../../utils/custom_colors.dart';

class ContactInfo extends StatelessWidget {

  final ContactModel contact;

  const ContactInfo({ Key? key, required this.contact }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${contact.name} ${contact.lastName}",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Teléfono: ",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                ),
              ),
              TextSpan(
                text: contact.phoneNumber,
                style: const TextStyle(
                  color: CustomColors.accentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }

}