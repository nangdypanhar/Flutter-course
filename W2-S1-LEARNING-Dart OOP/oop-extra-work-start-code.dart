// Class Tree

class Tree {
  String type;
  double height;

  Tree(this.type, this.height);

  @override
  String toString() {
    return 'Tree(type: $type, height: $height)';
  }
}

class Decorator {
  String position;
  String color;

  Decorator({
    required this.position,
    required this.color,
  });

  @override
  String toString() {
    return '(position: $position, color: $color)';
  }
}

// Class House
class House {
  Decorator window;
  Decorator roof;
  Decorator door;
  Decorator chimney;
  String address;
  List<Tree> trees = []; // by default empty

  House(
      {required this.address,
      required this.roof,
      required this.door,
      required this.chimney,
      required this.window});

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }


@override
String toString(){
  return 'House(address: $address,\n roof: $roof,\n door: $door,\n chimney: $chimney,\n window: $window,)';
}

}

void main() {
  House newHouse = House(
    address: "New York City",
    roof: Decorator(position: "Center", color: "Green"),
    door: Decorator(position: "bottomCenter", color: "Green"),
    chimney: Decorator(position: "topLeft", color: "Yellow"),
    window: Decorator(position: "topRight", color: "Red"),
  );
  print(newHouse);
}
