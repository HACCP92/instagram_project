import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_project/domain/post.dart';

class AccountModel {
  final Stream<QuerySnapshot<Post>> postStream = FirebaseFirestore.instance
      .collection('posts')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .withConverter<Post>(
        fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
        toFirestore: (post, _) => post.toJson(),
      )
      .snapshots();
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없습니다';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://images.therich.io/community/user/2208251122_2d05f9bb23335860d06d.jpg';
  }
}
