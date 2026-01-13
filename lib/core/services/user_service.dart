import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  Future<void> createUserIfNotExists(User user) async {
    final docRef = _db.collection('users').doc(user.uid);

    final doc = await docRef.get();

    if (!doc.exists) {
      await docRef.set({
        'uid': user.uid,
        'email': user.email,
        'provider': user.providerData.isNotEmpty
            ? user.providerData.first.providerId
            : 'anonymous',
        'createdAt': FieldValue.serverTimestamp(),
        'lastLogin': FieldValue.serverTimestamp(),
      });
    } else {
      // Atualiza último login
      await docRef.update({
        'lastLogin': FieldValue.serverTimestamp(),
      });
    }
  }
}
