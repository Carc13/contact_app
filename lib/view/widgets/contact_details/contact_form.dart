import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/contact_model.dart';
import '../../../view_model/contact_view_model.dart';
import '../widgets.dart';

class ContactForm extends StatefulWidget {

  final ContactModel? contact;

  const ContactForm({ Key? key, this.contact }) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  ContactModel? contact;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    
    if(widget.contact != null) {
      contact = widget.contact;
      _nameController.text = widget.contact!.name;
      _lastNameController.text = widget.contact!.lastName;
      _phoneController.text = widget.contact!.phoneNumber;
    }

  }

  Future<void> onPressed() async {

    FocusScope.of(context).unfocus();

    final bool? isValid = _form.currentState?.validate();

    if(isValid == null || !isValid) {

      return;

    }
   
    _form.currentState?.save();

    if(widget.contact != null) {

      await Provider.of<ContactViewModel>(context, listen: false).updateContactEvent(
        context: context,
        oldContact: contact!,
        updatedContact: ContactModel(
          name: _nameController.text,
          lastName: _lastNameController.text,
          phoneNumber: _phoneController.text
        )
      );

      contact = ContactModel(
        name: _nameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneController.text
      );

      return;

    }

    await Provider.of<ContactViewModel>(context, listen: false).addNewContactEvent(
      context: context,
      newContact: ContactModel(
        name: _nameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneController.text
      )
    );

  }

  void changeFocus() {

    if(_nameController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_nameFocusNode);
      return;
    } 

    if(_lastNameController.text.isEmpty){
      FocusScope.of(context).requestFocus(_lastNameFocusNode);
      return;
    }

    if(_phoneController.text.isEmpty){
      FocusScope.of(context).requestFocus(_phoneFocusNode);
      return;
    }

    onPressed();

  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _nameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            NameInput(
              controller: _nameController,
              focusNode: _nameFocusNode,
              onFieldSubmitted: (String value) => changeFocus()
            ),
            const SizedBox(
              height: 10,
            ),
            LastNameInput(
              controller: _lastNameController,
              focusNode: _lastNameFocusNode,
              onFieldSubmitted: (String value) => changeFocus()
            ),
            const SizedBox(
              height: 10,
            ),
            PhoneNumberInput(
              controller: _phoneController,
              focusNode: _phoneFocusNode,
              onFieldSubmitted: (String value) => changeFocus()
            ),
            const SizedBox(
              height: 30,
            ),
            SubmitButton(
              title: widget.contact != null ? "Guardar cambios": "Agregar",
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );

  }

}