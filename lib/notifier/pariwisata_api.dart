import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_kemenparekraf/models/model_data.dart';
import 'package:flutter/cupertino.dart';

class PariwisataNotifier with ChangeNotifier {
  List<Pariwisata> _listDestination = [];
  Pariwisata _selectedDestination;

  UnmodifiableListView<Pariwisata> get listDestination => UnmodifiableListView(_listDestination);
  Pariwisata get selectedDestination => _selectedDestination;

  set listDestination(List<Pariwisata> listDestination) {
    _listDestination = listDestination;
    notifyListeners();
  }

  set selectedDestination(Pariwisata pariwisata){
    _selectedDestination = pariwisata;
    notifyListeners();
  }
}

//Connection To Firebase
getPariwisata(PariwisataNotifier pariwisataNotifier, keyword, collection) async {
  QuerySnapshot snapshot = await Firestore.instance.collection(collection).getDocuments();

  keyword = keyword.toString().toLowerCase();
  print(keyword);

  List<Pariwisata> _listDestination = [];
  snapshot.documents.forEach((document) {
    String rawName = document.data["name"].toString().toLowerCase();
    String rawLocation = document.data["location"].toString().toLowerCase();

    if (rawName.contains(keyword) || rawLocation.contains(keyword)) {
      Pariwisata pariwisata = Pariwisata.fromMap(document.data);
      _listDestination.add(pariwisata);
    }
    pariwisataNotifier.listDestination = _listDestination;
  });
}