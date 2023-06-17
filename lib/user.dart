class User {
  final String name;
  final String surname;
  final String avatar;
  final String email;
  final int? friendsCount;

  User(
    String username, {
    required this.name,
    required this.surname,
    required this.avatar,
    required this.email,
    required this.friendsCount,
  });

  get group => null;

  get followersCount => null;
}
