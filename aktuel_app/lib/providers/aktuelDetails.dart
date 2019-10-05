import 'dart:convert';
import 'package:aktuel_app/providers/aktuelDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AktuelDetails with ChangeNotifier{
  List<AktuelDetail> _items=[];

   List<AktuelDetail> get items {
    return [..._items];
  }

   AktuelDetail findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> getAktuelDetails() async {
    const url ='http://192.168.1.28:8088/api/aktueldetails';
    try {
      final response = await http.get(url);
      Iterable extractedData = json.decode(response.body);
      List<AktuelDetail> loadedAktuelDetail= [];
      loadedAktuelDetail=extractedData.map((aktueldetail)=>AktuelDetail.fromJson(aktueldetail)).toList();
      _items=loadedAktuelDetail;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getAktuelDetailsById(int id) async {
    final url ='http://192.168.1.28:8088/api/aktueldetails/aktuel/$id';
    try {
      final response = await http.get(url);
      Iterable extractedData = json.decode(response.body);
      List<AktuelDetail> loadedAktuelDetail = [];
      loadedAktuelDetail=extractedData.map((aktueldetail)=>AktuelDetail.fromJson(aktueldetail)).toList();
      _items=loadedAktuelDetail;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}