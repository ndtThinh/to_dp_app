abstract class PersonEvent {}

class ChangeAgePressed extends PersonEvent {
  final int? agePlus;

  ChangeAgePressed({this.agePlus});
}
