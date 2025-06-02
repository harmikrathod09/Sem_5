class A{
  int aVar=10;
  void a(){
    print("Class A");
  }
}

class B extends A{
  int bVar=20;
  void b(){
    print("Class B");
    print("Value of A: $aVar");
    print("Value of B: $bVar");
  }
}

void main(){
  B b=B();
  b.a();
  b.b();
}