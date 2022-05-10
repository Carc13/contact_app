import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import '../models/contact_model.dart';

abstract class ContactRepository {

  Future<Either<Failure, List<ContactModel>>> getContacts();
  Future<Either<Failure, bool>> addNewContact({
    required ContactModel newContact
  });
  Future<Either<Failure, bool>> updateContact({
    required ContactModel oldContact,
    required ContactModel updatedContact
  });
  Future<Either<Failure, bool>> deleteContact({
    required ContactModel contact
  });

}