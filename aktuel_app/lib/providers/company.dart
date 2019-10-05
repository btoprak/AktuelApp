import 'package:flutter/foundation.dart';

class Company with ChangeNotifier {
  int id;
  String companyName;
  int companyId;
  String aktuelImageUrl;

  Company(int id, String companyName, int companyId, String aktuelImageUrl) {
    this.id = id;
    this.companyName = companyName;
    this.companyId = companyId;
    this.aktuelImageUrl = aktuelImageUrl;
  }

  Company.fromJson(Map json) {
    id = json["id"];
    companyName = json["companyName"];
    companyId = json["companyId"];
    aktuelImageUrl = json["aktuelImageUrl"];
  }

  Map toJson() {
    return {
      "id": id,
      "companyName": companyName,
      "companyId": companyId,
      "aktuelImageUrl": aktuelImageUrl
    };
  }
}
