import 'package:contact_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';
import 'contact_details_screen.dart';

class ContactListScreen extends StatelessWidget {

  static const String routeName = "/contact_list";

  const ContactListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const ScreenTitle(title: "Contactos"),
      ),
      body: const ContactList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Get.toNamed(ContactDetailsScreen.routeName);

        },
        heroTag: "add-new-contact",
        backgroundColor: CustomColors.accentColor,
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );

  }

}