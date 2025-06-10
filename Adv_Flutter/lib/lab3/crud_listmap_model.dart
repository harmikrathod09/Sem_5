class ModelClassCRUDOperation{
  List<Map<String, dynamic>> _userList=[];

  void addUser(Map<String, dynamic> user){
    _userList.add(user);
    print(_userList);
  }

  void removeUser(int index){
    _userList.removeAt(index);
  }

  void updateUser(Map<String, dynamic> user, int index){
    _userList[index]=user;
  }

  List<Map<String, dynamic>> readUser(){
    return _userList;
  }
}