import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/contact_model.dart';
import '../../../utils/custom_colors.dart';
import '../../pages/contact_details_screen.dart';
import '../widgets.dart';

class ContactItem extends StatelessWidget {

  final ContactModel contact;

  const ContactItem({ Key? key, required this.contact }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {

        Get.toNamed(ContactDetailsScreen.routeName, arguments: contact);

      },
      child: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: CustomColors.accentColor,
            width: 0.5
          )
        ),
        child: Row(
          children: [
            ContactLogo(
              lastName: contact.lastName,
              name: contact.name,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: ContactInfo(
                contact: contact,
              ),
            )

          ],
        ),
      ),
    );

  }

}