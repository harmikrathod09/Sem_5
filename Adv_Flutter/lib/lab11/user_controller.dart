import 'package:adv_flutter/lab11/api/api_service.dart';
import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

enum UserState { loading, success, error }

class UserController extends GetxController {
  RxList<User> userList = <User>[].obs;
  Rx<UserState> state = UserState.loading.obs;
  RxString errorMessage = ''.obs;// All fetched users
  RxList<User> filteredUsers = <User>[].obs; // Users shown on screen
  RxString searchQuery = ''.obs;

  void onInit() {
    super.onInit();
    getUsers();
  }

  void getUsers() async {
    state.value = UserState.loading;
    try {
      final users = await ApiService().fetchUsers();
      if (users != null && users.isNotEmpty) {
        userList.value = users;
        state.value = UserState.success;
      } else {
        userList.clear();
        errorMessage.value = "No data received.";
        state.value = UserState.error;
      }
    } catch (e) {
      userList.clear();
      errorMessage.value = e.toString();
      state.value = UserState.error;
    }
  }

  void filterUsers(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredUsers.value = userList;
    } else {
      filteredUsers.value = userList
          .where((user) => (user.name ?? '')
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    }
  }




  void addUser() {}

  void deleteUser() {}

  void editUser() {}
}
