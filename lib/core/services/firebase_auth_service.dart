import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  // LOGIN EMAIL
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  // CADASTRO EMAIL
  Future<User?> registerWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  // LOGIN GOOGLE
  Future<User?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null; // cancelado

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final result = await _auth.signInWithCredential(credential);
    return result.user;
  }

  // LOGIN ANÔNIMO
  Future<User?> signInAnonymously() async {
    final result = await _auth.signInAnonymously();
    return result.user;
  }

  // LOGOUT (importante!)
  Future<void> signOut() async {
    await _googleSignIn.signOut(); // evita login automático
    await _auth.signOut();
  }
}
