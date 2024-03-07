class Person {
  String? name;
  int? age;

  Person({this.name, this.age});

  Person copyWith({String? name, int? age}) {
    return Person(name: name ?? this.name, age: age ?? this.age);
  }
}
