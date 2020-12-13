class Moments {
  final int id;
  final DateTime date;
  final DateTime time;
  final String name;
  bool complete;
  final List<Medicine> medicine;

  set completeVariables(completeVariable) {
    return complete = completeVariable;
  }

  List<Medicine> get medicines {
    return medicine;
  }

  Moments(
    this.id,
    this.name,
    this.time,
    this.date,
    this.complete,
    this.medicine,
  );
}

class Medicine {
  final String medicine;
  final String dosage;
  bool taken;

  set medsTaken(takenVariable) {
    return taken = takenVariable;
  }

  // bool get takenValue {
  //   return taken;
  // }

  Medicine(this.medicine, this.dosage, this.taken);
}

final List<Moments> moments = [
  Moments(
      1, "Lunch", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 6, 8), true, [
    Medicine("GenPain", "100mg", true),
    Medicine("Paracetamol", "100mg", true)
  ]),
  Moments(2, "Op 't werk", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 6, 8),
      true, [Medicine("GenPain", "100mg", true)]),
  Moments(3, "Op 't werk", DateTime.utc(0, 0, 0, 15), DateTime.utc(2020, 6, 9),
      true, [
    Medicine("GenPain", "100mg", true),
    Medicine("Paracetamol", "100mg", true)
  ]),
  Moments(
      4, "Lunch", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 6, 9), false, [
    Medicine("GenPain", "100mg", false),
    Medicine("Paracetamol", "100mg", true)
  ]),
  Moments(5, "Op 't werk", DateTime.utc(0, 0, 0, 15), DateTime.utc(2020, 6, 9),
      false, [
    Medicine("GenPain", "100mg", false),
    Medicine("Paracetamol", "100mg", false)
  ]),
  Moments(
      6, "Lunch", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 6, 10), false, [
    Medicine("GenPain", "100mg", false),
    Medicine("Paracetamol", "100mg", false)
  ]),
];
