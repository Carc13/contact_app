import 'package:flutter/material.dart';

import '../../models/contact_model.dart';
import '../widgets/contact_details/contact_form.dart';
import '../widgets/widgets.dart';

class ContactDetailsScreen extends StatelessWidget {

  final ContactModel? contact;

  static const String routeName = "/contact_details";

  const ContactDetailsScreen({ Key? key, this.contact }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: ScreenTitle(title: contact != null ? "Editar contacto" : "Agregar contacto"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 30),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          ContactForm(
            contact: contact
          ),
        ],
      ),
    );

  }

}