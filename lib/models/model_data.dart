import 'package:cloud_firestore/cloud_firestore.dart';

class Pariwisata {
  String id;
  String name;
  String timeOpen;
  String location;
  String description;
  String image;
  Timestamp createdAt;

  Pariwisata.fromMap(Map<String, dynamic>data) {
    id = data['id'];
    name = data['name'];
    timeOpen = data['timeOpen'];
    location = data['location'];
    image = data['image'];
    description = data['description'];
  }
}