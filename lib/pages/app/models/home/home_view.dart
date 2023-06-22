import 'package:my_app/pages/app/data/enums/post_type.dart';
import 'package:my_app/pages/app/models/post_model.dart';
import 'package:my_app/pages/app/models/story_model.dart';
import 'package:my_app/pages/app/models/home/components/my_story_upload_card.dart';
import 'package:my_app/pages/app/models/home/post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/app/models/home/components/custom_icons.dart';
import 'package:my_app/pages/app/models/home/components/post_card.dart';
import 'package:my_app/pages/app/models/home/components/post_type_chips.dart';
import 'package:my_app/pages/app/models/home/components/story_card.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedPostType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Привет!,',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CustomIcons.heart,
              color: Colors.black,
              size: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Icon(
              CustomIcons.chat,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
      body: AnimationLimiter(
        child: ListView(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: dummyStories.length + 1,
                  padding: const EdgeInsets.only(left: 24),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const StoryUploadCard();
                    }
                    Story stories = dummyStories[index - 1];
                    return StoryCard(
                      story: stories,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 30,
                child: ListView.separated(
                  itemCount: PostType.values.length,
                  padding: const EdgeInsets.only(left: 24),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PostTypeChips(
                      isSelected: selectedPostType == index ? true : false,
                      onTap: () {
                        setState(() {
                          selectedPostType = index;
                        });
                      },
                      postType: PostType.values[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return PostCard(
                    post: dummyPosts[index],
                    onTap: () {
                      Get.to(() => PostDetailPage(
                            post: dummyPosts[index],
                          ));
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: dummyPosts.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
