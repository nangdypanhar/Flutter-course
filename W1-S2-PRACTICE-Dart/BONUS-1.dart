enum Direction { north, east, south, west }

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction

  Direction turnRight(Direction currentDirection) {
    switch (currentDirection) {
      case Direction.north:
        return Direction.east;
      case Direction.east:
        return Direction.south;
      case Direction.south:
        return Direction.west;
      case Direction.west:
        return Direction.north;
    }
  }

  Direction turnLeft(Direction currentDirection) {
    switch (currentDirection) {
      case Direction.north:
        return Direction.west;
      case Direction.west:
        return Direction.south;
      case Direction.south:
        return Direction.east;
      case Direction.east:
        return Direction.north;
    }
  }

  void advance() {
    switch (direction) {
      case Direction.north:
        y++;
        break;
      case Direction.south:
        y--;
        break;
      case Direction.east:
        x++;
        break;
      case Direction.west:
        x--;
        break;
    }
  }

  for (var instruction in instructions.split('')) {
    if (instruction == 'R' || instruction == 'r') {
      direction = turnRight(direction);
    } else if (instruction == 'L' || instruction == 'l') {
      direction = turnLeft(direction);
    } else if (instruction == 'A' || instruction == 'a') {
      advance();
    }
  }

  // Print the final position and direction
  print("Final position: ($x,$y) ");
  print("Facing: ${direction.toString().split('.').last}");
}
