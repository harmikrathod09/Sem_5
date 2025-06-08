class CounterModel{
  int _count=1;

  int get count => _count;

  void increment(){
    ++_count;
  }


  void decrement(){
    --_count;
  }
}