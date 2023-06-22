import 'package:my_app/pages/app/data/enums/post_type.dart';
import 'package:flutter/material.dart';

class PostModel {
  String id;
  String userName;
  String userImage;
  String location;
  String postTime;
  String description;
  PostType postType;
  String image;
  double likes;
  double comments;
  PostModel({
    required this.id,
    required this.userImage,
    required this.userName,
    required this.location,
    required this.postTime,
    required this.description,
    required this.postType,
    required this.image,
    required this.likes,
    required this.comments,
  });
}

List<PostModel> dummyPosts = [
  PostModel(
    id: '1',
    userName: 'Влад Султанов',
    location: 'Moldova Bender',
    postTime: '3мин назад',
    userImage:
        'https://sun9-49.userapi.com/impg/bNoG2-fLtFZ63gnNCOQgrPMP0Hq1VuYLGvsCHg/XL1YspYue-Y.jpg?size=564x564&quality=95&sign=58f3b872a4af61bdc7b2cec471eb2dff&type=album',
    description: 'Делаю на C# БЭК',
    postType: PostType.educational,
    image:
        'https://discuss.dev.twitch.tv/uploads/default/original/2X/3/3fd08435b77abd5ffff0ac672636bd566ad84914.png',
    likes: 5.3,
    comments: 10.4,
  ),
  PostModel(
    id: '2',
    userName: 'Стив Работа',
    location: 'New York, USA',
    postTime: '44мин назад',
    userImage:
        'https://sun9-78.userapi.com/impg/WPeSlHSVv0oWgIBd0zsjJ36n-RRKXrxE0frKyA/hMJxC5KifYo.jpg?size=730x728&quality=95&sign=772cad000b27d2bcc14cf9f54d2b110b&type=album',
    description: 'Новый айфон скоро',
    postType: PostType.politics,
    image:
        'https://www.thesun.co.uk/wp-content/uploads/2017/09/nintchdbpict000352512224.jpg',
    likes: 5.3,
    comments: 10.4,
  ),
];
