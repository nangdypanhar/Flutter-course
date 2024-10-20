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

enum Position { Center, Top, Right, Left, Bottom }

// Decorator
class Decorator {
  Position position;
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

// Class window
class Window extends Decorator {
  Window({required super.position, required super.color});
}

// Class Door
class Door extends Decorator {
  Door({required super.position, required super.color});
}

// Class chimeny
class chimeny extends Decorator {
  chimeny({required super.position, required super.color});
}

//
class Roof extends Decorator {
  Roof({required super.position, required super.color});
}

// Class House
class House {
  List<Tree> trees = [];
  List<Window> windows = [];
  List<Roof> roof = [];
  List<chimeny> chimney = [];
  List<Door> door = [];

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  void addWindow(Window window) {
    this.windows.add(window);
  }

  void addChinmey(chimeny chimeny) {
    this.chimney.add(chimeny);
  }

  void addRoof(Roof roof) {
    this.roof.add(roof);
  }

  void addDoor(Door door) {
    this.door.add(door);
  }

  @override
  String toString() {
    return 'House(roof: $roof,\n door: $door,\n chimney: $chimney,\n window: $windows,)';
  }
}

void main() {
  House newHouse = House();
  newHouse.addWindow(Window(position: Position.Right, color: "Red"));
  newHouse.addWindow(Window(position: Position.Left, color: "Green"));
  newHouse.addRoof(Roof(position: Position.Top, color: "Blue"));
  newHouse.addDoor(Door(position: Position.Center, color: "Black"));
  newHouse.addChinmey(chimeny(position: Position.Top, color: "Green"));
  print(newHouse);
}
