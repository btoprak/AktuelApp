import 'dart:convert';

import 'package:aktuel_app/providers/aktuel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Aktuels with ChangeNotifier{
  List<Aktuel> _items=[];

   List<Aktuel> get items {
    return [..._items];
  }

   Aktuel findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> getAktuels() async {
    const url ='http://192.168.1.28:8088/api/aktuels';
    try {
      final response = await http.get(url);
      Iterable extractedData = json.decode(response.body);
      List<Aktuel> loadedAktuel = [];
      loadedAktuel=extractedData.map((aktuel)=>Aktuel.fromJson(aktuel)).toList();
      _items=loadedAktuel;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getAktuelsById(int id) async {
    final url ='http://192.168.1.28:8088/api/aktuels/company/$id';
    try {
      final response = await http.get(url);
      Iterable extractedData = json.decode(response.body);
      List<Aktuel> loadedAktuel = [];
      loadedAktuel=extractedData.map((aktuel)=>Aktuel.fromJson(aktuel)).toList();
      _items=loadedAktuel;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}