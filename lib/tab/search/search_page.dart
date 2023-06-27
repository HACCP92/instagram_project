import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_project/create/create_page.dart';
import 'package:instagram_project/detail_post/detail_post_page.dart';
import 'package:instagram_project/domain/post.dart';
import 'package:instagram_project/tab/search/search_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  final List<String> _urls = const [
    'https://blog.kakaocdn.net/dn/sfCKe/btsfpe4aBSu/FMxrJcxaCde5xBGCIDJFpk/img.jpg',
    'https://cdn.eyesmag.com/content/uploads/posts/2022/04/04/burgerking-zanmang-loopy-collaboration-main-35c92b02-5c4f-47b5-8476-7c9ff936dbd7.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXS99FhQISGOM0bEEKTi5GcnnoaTDufKkhYQ&usqp=CAU',
    'https://blog.kakaocdn.net/dn/emPMWF/btqGbN7ZM6l/tyh5q9f4zbIssyXftTyReK/img.jpg',
    'https://blog.kakaocdn.net/dn/bnJnNH/btqS29YpFT1/RmTXw6q2yQcnZV5AOfymd1/img.jpg',
    'https://blog.kakaocdn.net/dn/bfKELN/btqVK7Ju4nV/DvWVeO2YdJyn2vC76h6J9K/img.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final model = SearchModel();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePage()),
          );
        },
        child: const Icon(Icons.create),
      ),
      appBar: AppBar(
        title: const Text('instagram project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: StreamBuilder<QuerySnapshot<Post>>(
            stream: model.postStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('알수 없는 에러');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              List<Post> posts =
                  snapshot.data!.docs.map((e) => e.data()).toList();
              return GridView.builder(
                itemCount: posts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final post = posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPostPage(post: post)),
                      );
                    },
                    child: Hero(
                      tag: post.id,
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
