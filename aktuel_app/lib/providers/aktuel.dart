import 'package:flutter/foundation.dart';

class Aktuel with ChangeNotifier{
  int id;
  String aktuelName;
  int aktuelId;
  String releasedDate;
  int companyId;
  String aktuelImageUrl;

  Aktuel(int id, String aktuelName, int aktuelId, String releasedDate,
      int companyId, String aktuelImageUrl) {
    this.id = id;
    this.aktuelName = aktuelName;
    this.aktuelId = aktuelId;
    this.releasedDate = releasedDate;
    this.companyId = companyId;
    this.aktuelImageUrl = aktuelImageUrl;
  }

  Aktuel.fromJson(Map json) {
    id = json["id"];
    aktuelName = json["aktuelName"];
    aktuelId = json["aktuelId"];
    releasedDate = json["releasedDate"];
    companyId = json["companyId"];
    aktuelImageUrl = json["aktuelImageUrl"];
  }

  Map toJson() {
    return {
      "id": id,
      "aktuelName": aktuelName,
      "aktuelId": aktuelId,
      "releasedDate": releasedDate,
      "companyId": companyId,
      "aktuelImageUrl": aktuelImageUrl,
    };
  }
}
