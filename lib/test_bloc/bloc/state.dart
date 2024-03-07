import 'package:equatable/equatable.dart';
import 'package:to_dp_app/test_bloc/person.dart';

abstract class PersonState extends Equatable {
  Person? person;

  @override
  List<Object?> get props => [person];

  PersonState({this.person});
}

class ConcretePersonState extends PersonState {
  ConcretePersonState(Person? person) : super(person: person);
}
