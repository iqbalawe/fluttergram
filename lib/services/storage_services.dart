import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  // get uid
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // add image to Firebase Storage
  Future<String> uploadImage(
      String childName, Uint8List file, bool isPost) async {
    var childUid = _auth.currentUser!.uid;

    Reference ref = _storage.ref().child(childName).child(childUid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
