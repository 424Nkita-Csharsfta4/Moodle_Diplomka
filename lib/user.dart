class User {
  final String name;
  final String surname;
  final String avatar;
  final String email;
  final int friendsCount;
  final String group;

  User({
    required this.name,
    required this.surname,
    required this.avatar,
    required this.email,
    required this.friendsCount,
    required this.group,
  });

  get followersCount => null;
}
