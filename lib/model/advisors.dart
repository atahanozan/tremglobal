import 'package:cloud_firestore/cloud_firestore.dart';

class Advisors {
  String id;
  String name;
  String team;
  String mail;
  String tel;
  String city;
  String image;
  String title;
  int day;
  int month;
  int year;

  Advisors({
    required this.id,
    required this.name,
    required this.team,
    required this.mail,
    required this.tel,
    required this.city,
    required this.image,
    required this.title,
    required this.day,
    required this.month,
    required this.year,
  });

  factory Advisors.fromSnapShot(DocumentSnapshot snapshot) {
    return Advisors(
      id: snapshot.id,
      name: snapshot['name'],
      team: snapshot['team'],
      mail: snapshot['mail'],
      tel: snapshot['tel'],
      city: snapshot['city'],
      image: snapshot['image'],
      title: snapshot['title'],
      day: snapshot['day'],
      month: snapshot['month'],
      year: snapshot['year'],
    );
  }
}
