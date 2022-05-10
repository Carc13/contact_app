import '../../error/exceptions.dart';
import '../../models/contact_model.dart';

class InMemoryDatasource {

  final List<ContactModel> _contacts = [
    const ContactModel(
      name: "Fulanito",
      lastName: "Perez",
      phoneNumber: "8095810000"
    )
  ];

  Future<List<ContactModel>> getContacts() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return [..._contacts];
    } catch(_) {
      throw UnexpectedException();
    }
  }

  Future<bool> addNewContact({
    required ContactModel newContact
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _contacts.add(newContact);
      return true;
    } catch(_) {
      throw UnexpectedException();
    }
  }

  Future<bool> updateContact({
    required ContactModel oldContact,
    required ContactModel updatedContact
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      int indexOfContact = _contacts.indexWhere((contact) => contact == oldContact);
      if(indexOfContact == -1) {
        throw UnexpectedException();
      }
      _contacts[indexOfContact] = updatedContact;
      return true;
    } catch(_) {
      throw UnexpectedException();
    }
  }

  Future<bool> deleteContact({
    required ContactModel contact,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      bool result = _contacts.remove(contact);
      if(result == false) {
        throw UnexpectedException();
      }
      return result;
    } catch(_) {
      throw UnexpectedException();
    }
  }

}