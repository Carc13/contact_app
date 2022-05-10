import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  const Failure([List properties = const <dynamic>[]]);

}

class UnexpectedFailure extends Failure {
  @override
  List<Object> get props => [];
}