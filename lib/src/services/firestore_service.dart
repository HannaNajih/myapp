import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/task.dart';
import '../models/user_model.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // add user with initial information to database

  // ignore: body_might_complete_normally_nullable
  Future<void>? addDeviceToken(
      {required UserModel user, required String token}) {
    if (user.reference != null) {
      user.reference!.update({
        'deviceTokens': FieldValue.arrayUnion([token])
      });
    } else {
      _firestore.collection('users').doc(user.uID).update({
        'deviceTokens': FieldValue.arrayUnion([token])
      });
    }
  }

  Future<UserModel> addUserWithInitialInformationToDB(
      {required User user,
      required String userName,
      String? phoneNumber,
      String? phone}) async {
    UserModel weCodeUser = UserModel(
        name: userName, email: user.email!, phone: phoneNumber, uID: user.uid);

    await _firestore.collection('users').doc(user.uid).set(weCodeUser.toMap());
    return weCodeUser;
  }

  Future<DocumentReference> addNewVacancy(Task vacancy) async {
    return await _firestore.collection('jobs').add(vacancy.toMap());
  }

  updateUserInformationFromCreateProfile({required UserModel weCodeUser}) {}
}
