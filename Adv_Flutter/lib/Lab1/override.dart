class A{
  void display(){
    print("A class");
  }
}

class B extends A{
  @override
  void display(){
    print("B class");
  }
}

void main(){
  A a=A();
  a.display();

  B b=B();
  b.display();
}