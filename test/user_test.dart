import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/user.dart';

void main() {
  test('User constructor creates a valid instance', () {
    final user = User(
      'JohnDoe',
      name: 'John',
      surname: 'Doe',
      avatar: 'https://example.com/avatar.jpg',
      email: 'john.doe@example.com',
      friendsCount: 10,
    );

    // Проверяем, что значения полей соответствуют переданным аргументам
    expect(user.name, 'John');
    expect(user.surname, 'Doe');
    expect(user.avatar, 'https://example.com/avatar.jpg');
    expect(user.email, 'john.doe@example.com');
    expect(user.friendsCount, 10);
  });

  test('User constructor creates an instance with null friendsCount', () {
    final user = User(
      'JohnDoe',
      name: 'John',
      surname: 'Doe',
      avatar: 'https://example.com/avatar.jpg',
      email: 'john.doe@example.com',
      friendsCount: null,
    );

    // Проверяем, что friendsCount имеет значение null
    expect(user.friendsCount, isNull);
  });
}
