import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {

  final String name;
  final String lastName;
  final String phoneNumber;

  const ContactModel({
    required this.name,
    required this.lastName,
    required this.phoneNumber
  });

  ContactModel copyWith({
    String? name,
    String? lastName,
    String? phoneNumber,
  }) {

    return ContactModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );

  }

  @override
  List<Object?> get props => [name, lastName, phoneNumber];

}