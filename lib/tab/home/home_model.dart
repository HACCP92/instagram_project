import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class HomeModel {
  final _picker = ImagePicker();

  Future<void> updateProfileImage() async {
    XFile? xfile = await _picker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      //이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child(
          'user/${FirebaseAuth.instance.currentUser?.uid}profile/${DateTime.now().millisecondsSinceEpoch}.png');

      // 이미지 url 얻고
      await imageRef.putFile(File(xfile.path));
      final downloadUrl = await imageRef.getDownloadURL();
      //선택한 사진 업로드

      // 업데이트
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(downloadUrl);
    }
  }

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
