
enum Avatar {
  man("assets/avatar/man.jpg"),
  boy("assets/avatar/boy.jpg");

  final String path;
  const Avatar(this.path);
}



enum Category {
  entertainment('Entertainment', 'assets/category/entertainment.jpg'),
  shopping('Shopping', 'assets/category/shopping.jpg'),
  food('Food', 'assets/category/food.jpg'),
  education('Education', 'assets/category/education.jpg'),
  transportation('Transportation', 'assets/category/transportation.jpg');

  final String name;
  final String image;

  const Category(this.name, this.image);
}