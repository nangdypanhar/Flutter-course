class Distance {
  final double _value;

  Distance({required double value}) : _value = value;
  double get value => _value;

  Distance.kms(double value) : this(value: value);
  Distance.meter(double value) : this(value: value / 1000);
  Distance.cms(double value) : this(value: value / 100000);

  Distance operator +(Distance b) {
    return Distance(value: value + b.value);
  }

  double get kms => value;
  double get cms => value * 100000;
  double get meter => value * 1000;
}

void main() {
  Distance a = Distance.cms(10.2);
  Distance b = Distance.kms(30);
  print("The total value :${(a+b).cms} cm");
}
