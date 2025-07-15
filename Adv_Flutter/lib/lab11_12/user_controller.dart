import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

enum UserState { loading, success, error }

class UserController extends GetxController {
  RxList<User> userList = <User>[].obs;
  RxList<User> filteredUsers = <User>[].obs;
  Rx<UserState> state = UserState.loading.obs;
  RxString errorMessage = ''.obs;
  RxString searchQuery = ''.obs;

  final ApiService api = ApiService();

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  void getUsers() async {
    state.value = UserState.loading;
    try {
      final users = await api.fetchUsers();
      if (users.isNotEmpty) {
        userList.value = users;
        filteredUsers.value = users;
        state.value = UserState.success;
      } else {
        userList.clear();
        filteredUsers.clear();
        errorMessage.value = "No data received.";
        state.value = UserState.error;
      }
    } catch (e) {
      userList.clear();
      filteredUsers.clear();
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

  Future<void> addUser(User user) async {
    try {
      await api.addUser(user);
      getUsers(); // Refresh list after add
    } catch (e) {
      Get.snackbar('Error', 'Failed to add user');
    }
  }

  Future<void> editUser(User updatedUser) async {
    try {
      await api.updateUser(updatedUser);
      getUsers(); // Refresh list after update
    } catch (e) {
      Get.snackbar('Error', 'Failed to update user');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await api.deleteUser(id);
      getUsers(); // Refresh list after delete
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete user');
    }
  }
}
