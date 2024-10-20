class MyDuration {
  final int _milliseconds;

  MyDuration({required int milliseconds}) : _milliseconds = milliseconds;
  int get milliseconds => _milliseconds;

  MyDuration.fromHours(int hr) : this(milliseconds: hr * 60 * 60 * 1000);
  MyDuration.fromMinutes(int min) : this(milliseconds: min * 60 * 1000);
  MyDuration.fromSeconds(int sec) : this(milliseconds: sec * 1000);

  MyDuration operator +(MyDuration b) {
    return MyDuration(milliseconds: milliseconds + b.milliseconds);
  }

  MyDuration operator -(MyDuration b) {
    int result = milliseconds - b.milliseconds;
    return result < 0
        ? throw ArgumentError("The result can't be negative")
        : MyDuration(milliseconds: result);
  }

  bool operator >(MyDuration b) {
    return this.milliseconds > b.milliseconds;
  }

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration dur1 = MyDuration.fromHours(30);
  MyDuration dur2 = MyDuration.fromMinutes(90);
  print(dur1 - dur2);
}
