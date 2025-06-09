import 'package:madf/utils/import_export.dart';

class ControllerCrudListMap{
    ModelClassCRUDOperation _controller=ModelClassCRUDOperation();

    void addUser(user)=>_controller.addUser(user);

    void removeUser(int index)=>_controller.removeUser(index);

    void updateUser(Map<String, dynamic> user, int index)=>_controller.updateUser(user, index);

    List<Map<String, dynamic>> readUser()=>_controller.readUser();
}