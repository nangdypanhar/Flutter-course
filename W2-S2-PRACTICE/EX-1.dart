enum Skill {
  FLUTTER("Flutter"),
  DART("Dart"),
  OTHER("Other");

  final String label;

  const Skill(this.label);

  String toString() => label;
}

enum Country {
  CAMBODIA("Cambodia"),
  JAPAN("Japan"),
  KOREA("Korea");

  final String label;

  const Country(this.label);

  String toString() => label;
}

class Address {
  final Country country;
  final String city;
  final String street;
  final int zipCode;

  Address(
      {required this.country,
      required this.city,
      required this.street,
      required this.zipCode});

  String toString() {
    return "$country,$city,$street,$zipCode";
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final Address _address;
  List<Skill> skills = [];
  final int exp;

  String get name => _name;
  double get baseSalary => _baseSalary;
  Address get address => _address;

  Employee(
      {required String name,
      required double baseSalary,
      required this.exp,
      required this.skills,
      required Address address})
      : _name = name,
        _baseSalary = baseSalary,
        _address = address;

  Employee.mobileDeveloper({
    required String name,
    required double salary,
    required int exp,
    required Address address,
  }) : this(
          name: name,
          baseSalary: salary,
          exp: exp,
          skills: [Skill.DART, Skill.FLUTTER],
          address: address,
        );

  double computeSalary() {
    double totalSalary = this.baseSalary;
    this.exp == 0 ? totalSalary : totalSalary += exp * 2000;
    skills.forEach((job) {
      if (job == Skill.FLUTTER)
        totalSalary += 4000;
      else if (job == Skill.DART)
        totalSalary += 3000;
      else
        totalSalary += 1000;
    });

    return totalSalary;
  }

  void printDetails() {
    String skillsStr = skills.map((skill) => skill.toString()).join(', ');
    print(
      'Employee: $name,\n Address : $address, \n Skill : $skillsStr, \n Base Salary: \$${baseSalary}, \n Exprience : $exp year,\n Total Salary : \$${computeSalary()} \n',
    );
  }
}

void main() {
  var emp1 = Employee(
    name: "Nangdy Panhar",
    baseSalary: 500,
    exp: 1,
    skills: [Skill.FLUTTER, Skill.DART],
    address: Address(
        country: Country.CAMBODIA,
        city: "Phnom Penh",
        street: "Stueng MeanChey",
        zipCode: 1200),
  );
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    name: "Tena",
    salary: 300,
    exp: 2,
    address: Address(
        country: Country.CAMBODIA,
        city: "Phnom Penh",
        street: "SMC",
        zipCode: 1200),
  );

  emp2.printDetails();
}
