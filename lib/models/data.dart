class Moments {
  final DateTime date;
  final DateTime time;
  final String name;
  bool complete;

  set completeVariables(completeVariable) {
    return complete = completeVariable;
  }

  Moments(this.name, this.time, this.date, this.complete);
}

final List<Moments> moments = [
  Moments("Lunch", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 6, 8), true),
  Moments(
      "Op 't werk", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 6, 8), true),
  Moments(
      "Op 't werk", DateTime.utc(0, 0, 0, 15), DateTime.utc(2020, 6, 9), true),
  Moments("Lunch", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 6, 9), false),
  Moments(
      "Op 't werk", DateTime.utc(0, 0, 0, 15), DateTime.utc(2020, 6, 9), false),
  Moments(
      "Lunch", DateTime.utc(0, 0, 0, 12), DateTime.utc(2020, 14, 10), false),
];
