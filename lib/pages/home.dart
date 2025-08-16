import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runway/models/category_model.dart';
import 'package:runway/pages/catergories.dart';
import 'package:video_player/video_player.dart';
import '../widgets/custom_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
        "assets/video/video.mp4",
    )..initialize().then((_) {
      setState(() {
        _controller.play();
      });
    })..setLooping(true);
    super.initState();
  }

  List<CategoryModel> category = [
    CategoryModel(
        image: "assets/images/category/Women.png",
        name: "Women",
    ),
    CategoryModel(
      image: "assets/images/category/Men.png",
      name: "Men",
    ),
    CategoryModel(
      image: "assets/images/category/Kids.png",
      name: "Kids",
    ),
    CategoryModel(
      image: "assets/images/category/Deals.png",
      name: "Deals",
    ),
    CategoryModel(
      image: "assets/images/category/Health.png",
      name: "Health",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Runway",
        prefix: "assets/svgs/menu.svg",
        suffix: "assets/svgs/notification.svg",
      ),

      body: Stack(
        children: [
           /// video
           AspectRatio(
               aspectRatio: _controller.value.aspectRatio,
               child: VideoPlayer(_controller),
           ),

          /// categories
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                    Gap(30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(
                            category.length,
                          (index) {
                              final item = category[index];
                             return Padding(
                               padding: const EdgeInsets.only(left: 12),
                               child: GestureDetector(
                                 onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => CategoriesScreen())),
                                 child: Column(
                                   children: [
                                     Image.asset(item.image,width: 75),
                                     Gap(10),
                                     Text(
                                       item.name,
                                       style: TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.w600,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             );
                          },
                        ),
                      ),
                    ),
                    Gap(30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}