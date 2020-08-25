import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference newsCollection =
      FirebaseFirestore.instance.collection('favourites');

  Future createUserCollection(String title, String posturl) async {
    return await newsCollection.doc(uid).set({
      'title': title,
      'posturl': posturl,
    });
  }
}
