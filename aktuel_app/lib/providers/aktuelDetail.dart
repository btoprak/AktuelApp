import 'package:flutter/foundation.dart';

class AktuelDetail with ChangeNotifier {
  int id;
  String content;
  String pageImageUrl;
  int aktuelId;

  AktuelDetail(int id, String content, String pageImageUrl, int aktuelId,
   ) {
    this.id = id;
    this.content = content;
    this.pageImageUrl = pageImageUrl;
    this.aktuelId = aktuelId;
  }

  AktuelDetail.fromJson(Map json) {
    id = json["id"];
    content = json["content"];
    pageImageUrl = json["pageImageUrl"];
    aktuelId = json["aktuelId"];
  }

  Map toJson() {
    return {
      "id": id,
      "content": content,
      "pageImageUrl": aktuelId,
      "aktuelId": aktuelId,
    };
  }
}
