import 'package:flutter/material.dart';
import 'package:instagram_project/tab/home/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final model = HomeModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('instagram Project'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Instagram에 오신것을 환영합니다',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text('사진과 동영상을 보려면 팔로우 하세요'),
            const SizedBox(height: 20),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: GestureDetector(
                        onTap: () async {
                          await model.updateProfileImage();
                          setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(model.getProfileImageUrl()),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      model.getEmail(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(model.getNickName()),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://pbs.twimg.com/media/FuyzERxagAAhWry.png',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4),
                        Image.network(
                          'https://mblogthumb-phinf.pstatic.net/MjAyMTA4MTFfMTYg/MDAxNjI4NjY1Njk2OTE5.zI5utVfYm3Z98PVDbvfYAYA_-um7GbO8Yp3C3C-gIUkg.vSyzN7z5odfgW4lN1oZivBW7mG-KWQSmD6RbH7Aijv0g.JPEG.bbekimha/%EA%B5%B0%EC%B9%A8%EC%8B%B9%EB%8F%84%EB%85%B8.jpg?type=w800',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4),
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmXUprmgEBzJ7k4gi4Hx4_qJ7Wsxdp5HvDIg&usqp=CAU',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Facebook 친구'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('팔로우'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
