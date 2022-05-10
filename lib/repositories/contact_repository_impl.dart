import 'package:dartz/dartz.dart';

import '../data/in_memory/in_memory_datasource.dart';
import '../error/failures.dart';
import '../models/contact_model.dart';
import './contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {

  final InMemoryDatasource datasource;

  ContactRepositoryImpl({
    required this.datasource
  });

  @override
  Future<Either<Failure, List<ContactModel>>> getContacts() async {
    try {
      List<ContactModel> contacts = await datasource.getContacts();
      return Right(contacts);
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addNewContact({ required ContactModel newContact }) async {
    try {
      bool result = await datasource.addNewContact(newContact: newContact);
      return Right(result);
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateContact({ required ContactModel oldContact, required ContactModel updatedContact }) async {
    try {
      bool result = await datasource.updateContact(oldContact: oldContact, updatedContact: updatedContact);
      return Right(result);
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteContact({ required ContactModel contact }) async {
    try {
      bool result = await datasource.deleteContact(contact: contact);
      return Right(result);
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

}