import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/contact_view_model.dart';
import '../widgets.dart';

class ContactList extends StatefulWidget {
  const ContactList({ Key? key }) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  @override
  void initState() {

    Future.delayed(
      const Duration(seconds: 1), 
      () => Provider.of<ContactViewModel>(context, listen: false).getContactsEvent(context: context)
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ContactViewModel>(
      builder: (context, conctactViewModel,_) {

        if(conctactViewModel.contacts == null) {

          return const ContactsLoading();

        }

        if(conctactViewModel.contacts!.isEmpty) {

          return const NoContacts();

        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 20, bottom: (MediaQuery.of(context).padding.bottom + 20)),
          itemCount: conctactViewModel.contacts!.length,
          itemBuilder: (context, index) => ContactItem(
            contact: conctactViewModel.contacts![index],
            key: Key(index.toString()),
          ),
        );

      },
    );

  }

}