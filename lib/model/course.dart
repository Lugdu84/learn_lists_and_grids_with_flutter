class Course {
  String element;
  bool bought = false;

  Course({required this.element});

  update() {
    bought = !bought;
  }
}
