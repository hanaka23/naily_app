import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

// ログイン状態を監視
final authStateProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);

final authRepositoryProvider = Provider((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthRepository(auth);
});

class AuthRepository {
  final FirebaseAuth _auth;
  AuthRepository(this._auth);

  Future<void> signIn({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp({required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
