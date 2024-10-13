void main() {
  // 1 - iLike
  String iLike = 'I like pizza';

 // Answer : I choose CONST because we know exact value at the complie-time.

  // 2 - toppings
  String toppings = 'with tomatoes';
  toppings += " and cheese";

  // Anwser : I choose VAR because the value of the variable can reassign.

  // 3 - message
  String message = '$iLike $toppings';
  print(message);

  // Answer : I choose FINAL because the value of the variable is assigned at the run-time.

  // 4 - rbgColors
  List<String> rbgColors = ['red', 'blue', 'green'];
  print(rbgColors);

  // Answer : I choose CONST because the variable cannot change.

  // 5 - weekDays
  List<String> weekDays = ['monday', 'tuesday', 'wednesday'];
  weekDays.add('thursday');
  print(weekDays);

  // Answer : I choose FINAL because the variable cannot reassign but the content of the list can be modify.

  // 6 - scores
  List<int> scores = [45,35,50];
  scores = [45,35,50, 78];
  print(scores);

  // Answer : I choose VAR because the variable can reassign the value.
}


