import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/test_bloc/bloc/event.dart';
import 'package:to_dp_app/test_bloc/bloc/state.dart';
import 'package:to_dp_app/test_bloc/person.dart';
import 'dart:async';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc({Person? person}) : super(ConcretePersonState(person)) {
    on<ChangeAgePressed>(changeAge);
  }

  //change age future function
  Future<void> changeAge(
      ChangeAgePressed event, Emitter<PersonState> emit) async {
    emit(ConcretePersonState(state.person?.copyWith(age: event.agePlus)));
  }
  //new change from ducthinh01
}
