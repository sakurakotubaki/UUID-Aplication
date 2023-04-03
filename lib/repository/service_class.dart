import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid_application/model/post_model.dart';

class ServiceClass {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> addPost(String nameController) async {
    final uid = auth.currentUser?.uid;
    final newPost = PostModel(
      id: uid,
      name: nameController,
    );
    await db.collection('post').doc(uid).set(newPost.toMap());
  }
}
