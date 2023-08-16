import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
//import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //ajout d'une image dans firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    String downloadUrl = " ";
    //String downloadUrl = await snapshot.ref.getDownloadURL();
    try {
      Reference ref =
          _storage.ref().child(childName).child(_auth.currentUser!.uid);

      if (isPost) {
        String id = const Uuid().v1();
        ref = ref.child(id);
      }

      // mettre au format uint8list -> Télécharger la tâche comme un future mais c'est pas un future
      UploadTask uploadTask = ref.putData(file);

      TaskSnapshot snapshot = await uploadTask;
      downloadUrl = await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('erreur post');
      //print(e.toString());
    }

    return downloadUrl;
  }
}

// class StorageMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   // adding image to firebase storage
//   Future<String> uploadImageToStorage(
//       String childName, Uint8List file, bool isPost) async {
//     // creating location to our firebase storage

//     Reference ref =
//         _storage.ref().child(childName).child(_auth.currentUser!.uid);
//     if (isPost) {
//       String id = const Uuid().v1();
//       ref = ref.child(id);
//     }

//     // putting in uint8list format -> Upload task like a future but not future
//     UploadTask uploadTask = ref.putData(file);

//     TaskSnapshot snapshot = await uploadTask;
//     String downloadUrl = await snapshot.ref.getDownloadURL();
//     return downloadUrl;
//   }
// }
