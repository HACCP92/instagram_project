import 'package:firebase_auth/firebase_auth.dart';

class DetailPostModel {
  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? '메일 없습니다';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없습니다';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://images.therich.io/community/user/2208251122_2d05f9bb23335860d06d.jpg';
  }
}
