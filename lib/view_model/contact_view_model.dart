import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../error/failures.dart';
import '../models/contact_model.dart';
import '../repositories/contact_repository.dart';
import '../utils/custom_snackbar.dart';

class ContactViewModel extends ChangeNotifier {

  late ContactRepository _repository;

  List<ContactModel>? _contacts;
  List<ContactModel>? get contacts => _contacts;

  ContactViewModel({
    required ContactRepository repository,
  }) {
    _repository = repository;
  }

  Future getContactsEvent({ required BuildContext context }) async {

    Either<Failure, List<ContactModel>> result = await _repository.getContacts();

    result.fold(
      (failure) => CustomSnackbarAndDialog.showErrorSnackbar(message: "Ha ocurrido un error inesperado"),
      (contacts) {
        _contacts = contacts;
        notifyListeners();
      }
    );

  }

  Future addNewContactEvent({
    required BuildContext context,
    required ContactModel newContact,
  }) async {

    Either<Failure, bool> result = await _repository.addNewContact(
      newContact: newContact
    );

    result.fold(
      (failure) => CustomSnackbarAndDialog.showErrorSnackbar(message: "Ha ocurrido un error inesperado"),
      (contacts) async {

        await getContactsEvent(context: context);
        Get.back();
        CustomSnackbarAndDialog.showNotificationSnackbar(message: "Se ha agregado un nuevo contacto.");

      }
    );

  }

  Future updateContactEvent({
    required BuildContext context,
    required ContactModel oldContact,
    required ContactModel updatedContact,
  }) async {

    Either<Failure, bool> result = await _repository.updateContact(
      oldContact: oldContact,
      updatedContact: updatedContact
    );

    result.fold(
      (failure) => CustomSnackbarAndDialog.showErrorSnackbar(message: "Ha ocurrido un error inesperado"),
      (result) async {
        
        await getContactsEvent(context: context);

        CustomSnackbarAndDialog.showNotificationSnackbar(message: "El contacto ha sido actualizado.");
      }
    );

  }

  Future deleteContactEvent({
    required BuildContext context,
    required ContactModel contact,
  }) async {

    Either<Failure, bool> result = await _repository.deleteContact(
      contact: contact
    );

    result.fold(
      (failure) => CustomSnackbarAndDialog.showErrorSnackbar(message: "Ha ocurrido un error inesperado"),
      (result) async {

        await getContactsEvent(context: context);
        Get.back();

      }
        
    );

  }

}