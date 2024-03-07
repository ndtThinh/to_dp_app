import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/test_bloc/person.dart';

class CounterCubit extends Cubit<Person> {
  CounterCubit() : super(Person(name: 'hello', age: 10));

  void changeAge(int newAge) => emit(state.copyWith(age: 10));
  // {'name':state.name,'age':state.age}

  void changeName(String newName) => emit(state.copyWith(name: newName));
}
