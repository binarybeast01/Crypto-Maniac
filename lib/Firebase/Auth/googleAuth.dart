import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();

GoogleSignInAccount? _user;
GoogleSignInAccount get user => _user!;

Future googleSignin() async {
  final googleUser = await googleSignIn.signIn();
  if (googleUser == null) return false;
  _user = googleUser;

  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  await FirebaseAuth.instance.signInWithCredential(credential);
  return true;
}
Future logOut() async {
  FirebaseAuth.instance.signOut();
  await googleSignIn.disconnect();
}
