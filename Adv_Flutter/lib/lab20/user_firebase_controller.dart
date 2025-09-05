import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_firebase_model.dart';

class UserFirebaseController {
  final CollectionReference _userCollection =
  FirebaseFirestore.instance.collection('users');

  // CREATE
  Future<void> addUser(String name, String email) async {
    await _userCollection.add({
      'name': name,
      'email': email,
    });
  }

  // READ (Stream for realtime updates)
  Stream<List<UserFirebaseModel>> getUsers() {
    return _userCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserFirebaseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // UPDATE
  Future<void> updateUser(String id, String newName, String newEmail) async {
    await _userCollection.doc(id).update({
      'name': newName,
      'email': newEmail,
    });
  }

  // DELETE
  Future<void> deleteUser(String id) async {
    await _userCollection.doc(id).delete();
  }
}
