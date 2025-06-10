abstract class AbstractClass {
  void display();
}

class ExtendClass extends AbstractClass {
  @override
  void display() {
    print("Abstract class demo");
  }
}

void main() {
  ExtendClass extendClass = ExtendClass();
  extendClass.display();
}
