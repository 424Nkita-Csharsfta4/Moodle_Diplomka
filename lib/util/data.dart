import 'dart:math';

Random random = Random();
List<String> names = [
  "Линг Вальднер",
  "Грицельда Баррера",
  "Ленард Милтон",
  "Брайант Марли",
  "Розальва Садберри",
  "Гвадалупе Рэтледж",
  "Брэнди Газда",
  "Курт Томс",
  "Розарио Гатрайт",
  "Ким Делф",
  "Стейси Кристенсен",
];

List<String> messages = [
  "Привет, как дела?",
  "Ты свободен завтра?",
  "Уже поздно. Иди спать!",
  "Это меня разбавило 😂😂",
  "Флаттер рулит!!!",
  "Последняя ракета🚀",
  "Гризманн подписался за Барсу❤️❤️",
  "Будешь присутствовать на встрече завтра?",
  "Ты злой на что-то?",
  "Давай сделаем серию интерфейсов.",
  "Можно услышать твой голос?",
];

List<String> notifs = [
  "${names[random.nextInt(10)]} и еще ${random.nextInt(100)} человек оценили вашу запись",
  "${names[random.nextInt(10)]} упомянул вас в комментарии",
  "${names[random.nextInt(10)]} поделился вашей записью",
  "${names[random.nextInt(10)]} прокомментировал вашу запись",
  "${names[random.nextInt(10)]} ответил на ваш комментарий",
  "${names[random.nextInt(10)]} отреагировал на ваш комментарий",
  "${names[random.nextInt(10)]} предложил вам присоединиться к группе",
  "${names[random.nextInt(10)]} попросил вас лайкнуть страницу",
  "У вас есть воспоминания с ${names[random.nextInt(10)]}",
  "${names[random.nextInt(10)]} отметил вас и еще ${random.nextInt(100)} человек в записи",
  "${names[random.nextInt(10)]} отправил вам запрос в друзья",
];

List<Map<String, dynamic>> notifications = List.generate(
    13,
    (index) => {
          "имя": names[random.nextInt(10)],
          "dp": "../assets/images/cm${random.nextInt(10)}.jpeg",
          "время": "${random.nextInt(50)} минут назад",
          "уведомление": notifs[random.nextInt(10)]
        });

List<Map<String, dynamic>> posts = List.generate(
    13,
    (index) => {
          "имя": names[random.nextInt(10)],
          "dp": "../assets/images/cm${random.nextInt(10)}.jpeg",
          "время": "${random.nextInt(50)} минут назад",
          "img": "../assets/images/cm${random.nextInt(10)}.jpeg"
        });

List<Map<String, dynamic>> chats = List.generate(
    13,
    (index) => {
          "имя": names[random.nextInt(10)],
          "dp": "../assets/images/cm${random.nextInt(10)}.jpeg",
          "сообщение": messages[random.nextInt(10)],
          "счетчик": random.nextInt(20),
          "время": "${random.nextInt(50)} минут назад",
          "isOnline": random.nextBool(),
        });

List<Map<String, dynamic>> groups = List.generate(
    13,
    (index) => {
          "имя": "Группа ${random.nextInt(20)}",
          "dp": "../assets/images/cm${random.nextInt(10)}.jpeg",
          "сообщение": messages[random.nextInt(10)],
          "счетчик": random.nextInt(20),
          "время": "${random.nextInt(50)} минут назад",
          "isOnline": random.nextBool(),
        });

List<String> types = ["текст", "изображение"];
List<Map<String, dynamic>> conversation = List.generate(
    10,
    (index) => {
          "пользователь": "Группа ${random.nextInt(20)}",
          "время": "${random.nextInt(50)} минут назад",
          "тип": types[random.nextInt(2)],
          "replyText": messages[random.nextInt(10)],
          "isMe": random.nextBool(),
          "isGroup": false,
          "isReply": random.nextBool(),
        });

List<Map<String, dynamic>> friends = List.generate(
    13,
    (index) => {
          "имя": names[random.nextInt(10)],
          "dp": "../assets/images/cm${random.nextInt(10)}.jpeg",
          "статус": "Здесь может быть что угодно",
          "isAccept": random.nextBool(),
        });
