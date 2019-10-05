import 'dart:convert';

import 'package:aktuel_app/providers/company.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Companies with ChangeNotifier{
  List<Company> _items=[];

   List<Company> get items {
    return [..._items];
  }

  Future<void> getCompanies([bool param0]) async {
    const url ='http://192.168.1.28:8088/api/companies';
    try {
      final response = await http.get(url);
      Iterable extractedData = json.decode(response.body);
      List<Company> loadedCompanies = [];
      loadedCompanies=extractedData.map((company)=>Company.fromJson(company)).toList();
      _items=loadedCompanies;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}