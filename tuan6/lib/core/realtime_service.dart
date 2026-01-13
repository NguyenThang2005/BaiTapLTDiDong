import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeService {
  final _auth = FirebaseAuth.instance;

  // ✅ CÁCH ĐÚNG – TƯƠNG THÍCH firebase_database 10.x
  final FirebaseDatabase _db = FirebaseDatabase(
    databaseURL:
    'https://uth-smarttasks-8c401-default-rtdb.europe-west1.firebasedatabase.app',
  );

  Future<void> saveUser() async {
    final user = _auth.currentUser;
    if (user == null) return;

    print('✅ Realtime: saveUser ${user.uid}');

    await _db.ref('online_users/${user.uid}').set({
      'uid': user.uid,
      'email': user.email,
      'status': 'online',
      'lastSeen': ServerValue.timestamp,
    });
  }

  Future<void> setOnline(bool online) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _db.ref('online_users/${user.uid}').update({
      'status': online ? 'online' : 'offline',
      'lastSeen': ServerValue.timestamp,
    });
  }
}
