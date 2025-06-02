class A{
  static int AVAR=1;
}

class B extends A{
  void incrementByOne(){
    print("Before increment AVAR value: ${A.AVAR}");
    A.AVAR++;
    print("B class AVAR value: ${A.AVAR}");
  }
}

class C extends B{
  @override
  void incrementByOne(){
    super.incrementByOne();
    A.AVAR++;
    print("C class AVAR value: ${A.AVAR}");
  }
}

void main(){
  C c=C();
  c.incrementByOne();
}