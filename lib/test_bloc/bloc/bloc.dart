import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/test_bloc/bloc/event.dart';
import 'package:to_dp_app/test_bloc/bloc/state.dart';
import 'package:to_dp_app/test_bloc/person.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc({Person? person}) : super(ConcretePersonState(person)) {
    on<ChangeAgePressed>((event, emit) =>
        emit(ConcretePersonState(state.person?.copyWith(age: event.agePlus))));
  }
}
