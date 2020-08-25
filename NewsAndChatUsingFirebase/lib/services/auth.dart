import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences prefs;
  User currentUser;

  // Create User based on FirebaseUser
  FbUser _userFromFirebaseUser(User user) {
    return user != null ? FbUser(uid: user.uid) : null;
  }

  //auth change user Stream
  Stream<FbUser> get user {
    // ignore: deprecated_member_use
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Sign-In Anony
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign-In Email & Pass
  Future signIn(String email, String password) async {
    prefs = await SharedPreferences.getInstance();
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      final QuerySnapshot resultdocuments = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: user.uid)
          .get();
      final List<DocumentSnapshot> documents = resultdocuments.docs;
      await prefs.setString('id', documents[0].data()['id']);
      await prefs.setString('nickname', documents[0].data()['nickname']);
      _save(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register Email & Pass
  Future registerEmail(String nickname, String email, String password) async {
    prefs = await SharedPreferences.getInstance();
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      FirebaseFirestore.instance
          .collection('users')
          // ignore: deprecated_member_use
          .document(user.uid)
          .set({
        'displayName': nickname,
        'id': user.uid,
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        'chattingWith': null,
      });
      currentUser = user;
      await prefs.setString('id', user.uid);
      await prefs.setString('nickname', nickname);
      _save(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign-Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// local Storage
_save(User user) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'User_id';
  final value = user.uid;
  prefs.setString(key, value);
}
